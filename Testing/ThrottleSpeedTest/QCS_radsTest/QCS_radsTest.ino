#include <Servo.h>

int currTime;
int prevTime;
int currLevel;
int prevLevel;
int pulseCount;
int throttleSignal = 1000;
int measureCount;
Servo ESC;

int samplePeriod = 100;

void setup()
{
  pinMode(D0, INPUT);
  pinMode(D2, OUTPUT);
  Serial.begin(115200);
  ESC.attach(D2);
  ESC.writeMicroseconds(throttleSignal);
  delay(5000);
}

void loop()
{
  while (throttleSignal <= 1400)
  {
    ESC.writeMicroseconds(throttleSignal);
    measureCount = 0;
    while (measureCount <= 5)
    {
      prevTime = millis();
      pulseCount = 0;
      while ((currTime - prevTime) < samplePeriod)
      {
        currLevel = digitalRead(D0);
        if (currLevel == LOW && prevLevel == HIGH)
        {
          prevLevel = LOW;
        }
        else if (currLevel == HIGH && prevLevel == LOW) 
        {
          prevLevel = HIGH;
          pulseCount++;
        }
        currTime = millis();
      }
      
      Serial.print(throttleSignal);
      Serial.print("\t");
      Serial.println(pulse2rads(pulseCount, samplePeriod), DEC);
      measureCount++;
    }
    throttleSignal += 10;
    yield();
  }
  throttleSignal = 1000;
  ESC.writeMicroseconds(throttleSignal);
  while(1)
  {
    yield();
  }
}

double pulse2rads(int n, int Ts)
{
  double w;
  double t;
  int N = 24; //number of pusles per rotation of encoder
  t = (double)(Ts/1000.d); //convert period to seconds

  w = (2*3.141592*n)/(N*t);

  return w;
}
