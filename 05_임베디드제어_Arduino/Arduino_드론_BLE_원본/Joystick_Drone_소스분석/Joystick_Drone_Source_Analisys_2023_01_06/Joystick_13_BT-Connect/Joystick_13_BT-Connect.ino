//-----------------------------------------------
//-----------------------------------------------
#include <SoftwareSerial.h>

#define OPERATION_STEP_0  0
#define OPERATION_STEP_1  1
#define OPERATION_STEP_2  2

SoftwareSerial bleSerial(A0, A1); // RX, TX
//-----------------------------------------------
unsigned int currentStep;
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  bleSerial.begin(9600);
  bleSerial.print("at\r");
  bleSerial.setTimeout(2);
  bleSerial.readString();

  for(int i = 5; i < 11; i++)
  {
    pinMode(i,INPUT);
    digitalWrite(i,HIGH);
  }
  
  currentStep = 0;
}

void loop()
{
  switch(currentStep)
  {
    case OPERATION_STEP_0:
      Serial.println("Connect Test");
      currentStep++;
    break;
    case OPERATION_STEP_1:
      if(!digitalRead(9))
      {
        Serial.println("Pressed Connect Button");
        bleSerial.print("atd");
        bleSerial.print("083a5c1f2053");
        bleSerial.print("\r");
        currentStep++;
      }
    break;
    case OPERATION_STEP_2:
      if(!digitalRead(10))
      {
        Serial.println("Pressed Disconnect Button");
        bleSerial.print("ath");
        bleSerial.print("\r");
        currentStep = OPERATION_STEP_1;
      }
    break;
  }
}
