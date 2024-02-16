#include <SPI.h>
#include <SD.h>

long maxTimeMs = 0;
float x;

void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(250000);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  analogReadResolution(12);
}

void loop(){
  while (!Serial.available());
  x = Serial.readString().toInt();
  float maxTime = float(x); // in s
  maxTimeMs = long(maxTime * 1000)+ millis();
  //Serial.println("\\#Zeit_µs;Messwert");
  while(millis() < maxTimeMs)
  {
      Serial.println( String(micros()) + ";" + String(analogRead(0)));
  }
  Serial.println("\\#Done");
}
