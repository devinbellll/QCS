#include <Servo.h>

int throttleZero = 1000;
int throttleMax = 2000;
int throttleIn;

Servo ESC;
int ESC_Pin = 2;

void setup()
{
  pinMode(ESC_Pin, OUTPUT);
  Serial.begin(115200);
  ESC.attach(ESC_Pin);
  delay(100);
  ESC.writeMicroseconds(throttleZero);
  Serial.println("Throttle low, ready for test");
  
// SECTION FOR CALIBRATION ESC //
  
//  ESC.writeMicroseconds(throttleMax);
//  while(!Serial.available()) {
//    Serial.println("Calibrating, throttle high... Enter 'l' when ready");
//    delay(500);
//  }
//  if(Serial.read() == 'l') {
//      ESC.writeMicroseconds(throttleZero);
//      Serial.println("Throttle low, ready for test");
//  }

//////////////////////////////////

}

void loop()
{
  
  if(Serial.available()) {

    throttleIn = Serial.parseInt();
  
    if(throttleIn == -1) {
      Serial.println("Done, Exiting");
      ESC.writeMicroseconds(throttleZero);
      while(1) {
        yield();
      }
    }
    
    else {
      
      Serial.print("Throttle set to: "); Serial.println(throttleIn);
      Serial.println();
      ESC.writeMicroseconds(throttleZero + throttleIn);
      
    }
  }
}
