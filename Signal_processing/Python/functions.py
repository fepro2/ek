#!/usr/bin/env python
# -*- coding: utf-8 -*-

import serial
import re
import time
import json

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.signal import butter, lfilter
from scipy.signal import find_peaks


def calculateSamplingRate(timeVec):  # timeVec [µs]
    deltaTimeVec = []
    length = len(timeVec)

    for i in range(1, length):
        dt = timeVec[i] - timeVec[i - 1]
        deltaTimeVec.append(dt)

    deltaTimeVec = np.array(deltaTimeVec)
    sampling_rate = np.mean(deltaTimeVec)
    sampling_rate = sampling_rate / 1000
    return sampling_rate


def plot_signal(x, y):
    plt.plot(x, y)
    plt.show()


def load_json(path="ek_config.json"):
    with open(path, 'r') as openfile:
        json_object = json.load(openfile)
    return json_object


def write_json(dictionary, filename=""):
    json_object = json.dumps(dictionary, indent=4)
    with open(filename, "w") as outfile:
        if outfile.write(json_object):
            print(filename, "created or updatet.")


def read_serial_port(port, baud_rate, record_duration):  # record_duration in seconds
    ser = serial.Serial(port, baud_rate)
    data = []
    record_duration = str(record_duration)
    time.sleep(1)
    ser.write(record_duration.encode('utf-8'))
    print("Start Recording", record_duration, "s")
    while True:
        line = ser.readline()
        data.append(line)
        if re.search("Done", str(line)):
            break
    ser.close()
    print("Finish Recording")
    return data


def tare(port, baud_rate, record_duration):
    input("TARING: Open WB or remove any product weight and press enter.")
    data = read_serial_port(port, baud_rate, record_duration)
    timevec_raw, adc = split_recording(data)
    adc = np.array(adc)
    tare_value = np.mean(adc)
    print("Tare_value: ", tare_value, " [-]")
    return tare_value


def calibrate(port, baud_rate, calibration_load_g=0.0, record_duration=30):
    input("CALIBRATION: Add calibration weight and press enter.")
    data = read_serial_port(port, baud_rate, record_duration)
    timevec_raw, adc = split_recording(data)
    adc = np.array(adc)
    calibration_load = np.mean(adc)
    print("Calibration Load: ", calibration_load, " [-]")
    print("Last value of calibration_load_g:", calibration_load_g, "[g]")
    value = input(
        "CALIBRATION:"
        " Enter the value of the calibration weight in [g] and press enter."
        " If the value hasn't changed leave the field empty.")
    if value != "":
        calibration_load_g = float(value)
    return calibration_load, calibration_load_g


def process_measurement(data, tare_value, calibration_factor):
    timevec_raw, adc = split_recording(data)
    timevec_raw = np.array(timevec_raw)
    sampling_rate = calculateSamplingRate(timevec_raw)
    print("Sampling Rate: ", sampling_rate, " ms")

    sampling_frequency = 1 / (sampling_rate / 1000)
    print("Sampling Frequency: ", sampling_frequency, " Hz")

    number_samples = len(timevec_raw)
    max_time = (number_samples - 1) * sampling_rate

    timevec_new = np.linspace(0, max_time, number_samples)
    adc = np.array(adc)
    print("Mean ADC: ", np.mean(adc), " [-]")
    adc_g = convert_to_gram(tare_value, calibration_factor, adc)

    print("Mean ADC_g: ", np.mean(adc_g), " g")
    return timevec_new, adc_g, sampling_rate, sampling_frequency


def read_raw_measurement(path):
    data = load_json(path)
    timevec_new = data["time"]
    adc_g = data["adc_g"]

    print("Mean ADC_g: ", np.mean(adc_g), " g")

    sampling_rate = calculateSamplingRate(timevec_new) * 1000
    print("Sampling Rate: ", sampling_rate, " ms")

    sampling_frequency = 1 / (sampling_rate / 1000)
    print("Sampling Frequency: ", sampling_frequency, " Hz")
    return timevec_new, adc_g, sampling_rate, sampling_frequency


def split_recording(data):
    time = []
    signal = []

    for line in data:
        line = str(line)
        line = line[2:]
        line = line[:-5]

        try:
            a, b = line.split(";")
            time.append(int(a))
            signal.append(int(b))
        except ValueError:
            next
    return time, signal


def convert_to_gram(tare_value, calibration_factor, datavector):
    converted_data = []
    for i in range(len(datavector)):
        converted_value = (datavector[i] - tare_value) / calibration_factor
        converted_data.append(converted_value)
    return converted_data


def butter_lowpass_coefficents(cutoff_frequency, sample_frequency, order=4):
    nyq = 0.5 * sample_frequency
    low = cutoff_frequency / nyq
    b, a = butter(order, low, btype='low')
    return b, a


def butter_lowpass_filter(data, cutoff_frequency, sample_frequency, order=4):
    b, a = butter_lowpass_coefficents(cutoff_frequency, sample_frequency, order=order)
    y = lfilter(b, a, data)
    return y


def analyze_frequencies(
            data,
            sample_rate,
            lower_border,
            upper_border,
            ek_config,
            path,
            shorttext,
            amount_zeros=20000
            ):
    # sample_rate in ms, borders are indices

    dt = sample_rate / 1000

    reduced_data = data[lower_border:upper_border]

    offset = np.mean(reduced_data)
    length = len(reduced_data)
    offsetVector = np.linspace(offset, offset, length, endpoint=True)
    reduced_data = reduced_data - offsetVector
    sigma = np.std(reduced_data) * 1000
    sigma = round(sigma, 0)
    minimum = min(reduced_data) * 1000
    maximum = max(reduced_data) * 1000
    delta = maximum - minimum

    print("Mean: ", round(offset*1000, 3), " mg")
    print("Standarddeviation Sigma = 68,27%: +-", sigma, "mg")
    print("Standarddeviation 1,645 x Sigma = 90 %: +-", round(1.645 * sigma, 0), "mg")
    print("Standarddeviation 2,576 x Sigma = 99 %: +-", round(2.576 * sigma, 0), "mg")
    print("Minimum = ", round(minimum, 0), "mg")
    print("Maximum = ", round(maximum, 0), "mg")
    print("Maximum - Minimum = ", round(delta, 0), "mg")

    plt.xlabel('Time (ms)')
    plt.ylabel('Weight Value (g)')
    length = len(reduced_data)
    time = np.linspace(0, length*sample_rate, length, endpoint=False)
    plt.plot(time, reduced_data)
    plt.grid()
    plt.show()

    if ek_config["save_results"]:
        text = shorttext + "_timesignal_reduced_fft"
        dict = {}
        dict["time_ms"] = time
        dict["signal_adc"] = reduced_data
        save_excel(dict, path, text)

    # Filling with zero values to get a finer frequency resolution
    nullVector = np.linspace(0, 0, amount_zeros, endpoint=True)
    reduced_data = np.append(reduced_data, nullVector)

    hann = np.hanning(len(reduced_data))

    Y = np.fft.fft(hann*reduced_data)

    N = len(Y) / 2 + 1
    N = int(N)
    fa = 1.0/dt  # sample frequency
    print('dt=%.5fs (Sample Time)' % dt)
    print('fa=%.2fHz (Sample Frequency)' % fa)

    X = np.linspace(0, fa/2, N, endpoint=True)
    df = X[1] - X[0]
    print('df=%.2fHz (Frequency Resolution)' % df)
    Ynormiert = 2.0 * np.abs(Y[:N])/N

    plt.plot(X, Ynormiert)
    plt.xlabel('Frequency ($Hz$)')
    plt.ylabel('Amplitude')
    plt.grid()
    plt.show()

    untereGrenzeY = 0
    obereGrenzeY = 113

    plt.plot(X[untereGrenzeY:obereGrenzeY], Ynormiert[untereGrenzeY:obereGrenzeY])
    plt.xlabel('Frequency ($Hz$)')
    plt.ylabel('Amplitude')
    plt.grid()
    plt.show()
    return X, Ynormiert


def save_excel(table, path, text):
    df = pd.DataFrame.from_dict(table)
    filename = text + ".xlsx"
    path = path + "/" + filename
    df.to_excel(path, sheet_name=filename[0:30])


def export_csv(tabelle, path, text):
    df = pd.DataFrame(tabelle)
    filename = text + ".csv"
    pfad = path + "/" + filename
    df.to_csv(pfad, index=None, header=True, sep=";")


def detectPeaks(frequency, amplitude, plots):  # Detect signal peaks
    
    amplitude = np.array(amplitude)
    indexPeak, _ = find_peaks(amplitude)

    indexPeak2 = np.array(indexPeak)
    indexPeak2.flatten()

    frequency = np.array(frequency)

    try:
        amplitudePeak = amplitude[indexPeak2]
    except:
        print(TypeError)
        print(amplitude[39])
    frequencyPeak = [indexPeak2]

    if plots:

        plt.scatter(frequencyPeak, amplitudePeak, color="Red")
        plt.plot(frequency, amplitude)
        plt.show()

    return frequencyPeak, amplitudePeak


def findFrequencyOfHighestAmplitude(frequencyPeak, amplitudePeak, lowestFrequency):
    # Find frequency with the highest amplitude (lowestFrequency is the lower limit)
    length = len(frequencyPeak)
    frequency = 0
    amplitude = 0
    for i in range(length):
        if frequencyPeak[i] >= lowestFrequency:
            if amplitudePeak[i] > amplitude:
                frequency = frequencyPeak[i]
                amplitude = amplitudePeak[i]
    return frequency
