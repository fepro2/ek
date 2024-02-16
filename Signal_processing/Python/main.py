#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Recording and analysing of experimental kit weigh signal
# Felix Profe
# 2024-02-03

import datetime

from functions import *

if __name__ == "__main__":
    FILENAME_CONFIG = "ek_config.json"
    ek_config = load_json(FILENAME_CONFIG)
    
    # Parameter
    PORT = ek_config["port"]
    BAUD_RATE = ek_config["baud_rate"]
    TARE_VALUE = ek_config["tare_value"]
    CALIBRATION_LOAD_G = ek_config["calibration_load_g"]
    CALIBRATION_LOAD = ek_config["calibration_load"]
    CALIBRATION_FACTOR = (CALIBRATION_LOAD - TARE_VALUE) / CALIBRATION_LOAD_G
    STATIC_AVERAGING_STEPS = ek_config["static_averaging_steps"]
    FILTER_ORDER_1 = ek_config["filter_order_1"]
    FILTER_CUTOFF_FREQUENCY_1 = ek_config["filter_cutoff_frequency_1"]  # Hz
    FILTER_ORDER_2 = ek_config["filter_order_2"]
    FILTER_CUTOFF_FREQUENCY_2 = ek_config["filter_cutoff_frequency_2"]  # Hz
    RECORD_DURATION = ek_config["record_duration"]  # s
    CALIBRATION = ek_config["calibration"]
    TARING = ek_config["taring"]
    TARING_DURATION = ek_config["taring_duration"]
    CALIBRATION_DURATION = ek_config["calibration_duration"]
    LOWEST_FREQUENCY_HZ = ek_config["lowest_frequency_hz"]

    dateTime = datetime.datetime.now()
    dateTimeString = dateTime.strftime("%Y%m%d_%H%M")
    shorttext = ek_config["event_name"]
    shorttext = str(dateTimeString) + "_" + shorttext
    path = "results"
        
    if TARING:
        TARE_VALUE = tare(PORT, BAUD_RATE, record_duration=TARING_DURATION)
        ek_config["tare_value"] = TARE_VALUE
        ek_config["taring"] = False
        write_json(ek_config, FILENAME_CONFIG)
        
    if CALIBRATION:
        CALIBRATION_LOAD, CALIBRATION_LOAD_G = calibrate(
                PORT,
                BAUD_RATE,
                CALIBRATION_LOAD_G,
                record_duration=CALIBRATION_DURATION
        )
        ek_config["calibration_load"] = CALIBRATION_LOAD
        ek_config["calibration_load_g"] = CALIBRATION_LOAD_G
        CALIBRATION_FACTOR = (CALIBRATION_LOAD - TARE_VALUE) / CALIBRATION_LOAD_G
        ek_config["calibration"] = False
        write_json(ek_config, FILENAME_CONFIG)

    if ek_config["recording"]:
        data = read_serial_port(PORT, BAUD_RATE, RECORD_DURATION)
        timevec, adc_g, sampling_rate, sampling_frequency = process_measurement(data, TARE_VALUE, CALIBRATION_FACTOR)
        if ek_config["save_raw_measurement"]:
            dict = {}
            dict["time"] = timevec.tolist()
            dict["adc_g"] = adc_g
            path_raw_measurement = "raw/" + shorttext + ".json"
            write_json(dict, path_raw_measurement)     
    else:
        timevec, adc_g, sampling_rate, sampling_frequency = read_raw_measurement(ek_config["path_raw_measurement"])
        print("Mean ADC_g: ", np.mean(adc_g), " g")
        
    print("Mean ADC_g_static: ", np.mean(adc_g[STATIC_AVERAGING_STEPS:]), " g")

    adc_g_filtered_1 = butter_lowpass_filter(
            adc_g,
            FILTER_CUTOFF_FREQUENCY_1,
            sampling_frequency,
            FILTER_ORDER_1
    )
    adc_g_filtered_2 = butter_lowpass_filter(
            adc_g_filtered_1,
            FILTER_CUTOFF_FREQUENCY_2,
            sampling_frequency,
            FILTER_ORDER_2
    )
    plt.plot(timevec, adc_g)
    plt.plot(timevec, adc_g_filtered_1)
    plt.plot(timevec, adc_g_filtered_2)
    plt.show()

    plt.plot(adc_g)
    plt.show()

    # Frequency Analysis
    lower_border = input("Lower Border:")
    lower_border = int(lower_border)

    upper_border = input("Upper Border:")
    upper_border = int(upper_border)

    frequency_vector, amplitude_vector = analyze_frequencies(
            adc_g,
            sampling_rate,
            lower_border,
            upper_border,
            ek_config,
            path,
            shorttext
    )

    if ek_config["save_results"]:
        text = shorttext + "_timesignal"
        dict = {}
        dict["time_ms"] = timevec
        dict["signal_adc"] = adc_g
        dict["signal_adc_filter_o" + str(FILTER_ORDER_1) + "f" + str(FILTER_CUTOFF_FREQUENCY_1)] = adc_g_filtered_1
        dict["signal_adc_filter_o" + str(FILTER_ORDER_2) + "f" + str(FILTER_CUTOFF_FREQUENCY_2)] = adc_g_filtered_2
        save_excel(dict, path, text)

        textfft = shorttext + "_fft"
        dict = {}
        dict["frequency_hz"] = frequency_vector
        dict["amplitude"] = amplitude_vector
        save_excel(dict, path, textfft)

        frequency_peaks, amplitude_peaks = detectPeaks(frequency_vector, amplitude_vector, plots=True)
        textPeak = shorttext + "_fftPeaks"
        dict = {}
        dict["frequency_hz"] = frequency_peaks
        dict["amplitude"] = amplitude_peaks
        save_excel(dict, path, textPeak)

        peakFrequency = findFrequencyOfHighestAmplitude(frequency_peaks, amplitude_peaks, LOWEST_FREQUENCY_HZ)
        print(peakFrequency, "Hz")
