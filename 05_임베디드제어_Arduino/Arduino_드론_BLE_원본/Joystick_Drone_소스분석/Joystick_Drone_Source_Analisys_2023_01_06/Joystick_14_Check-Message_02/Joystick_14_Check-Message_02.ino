//-----------------------------------------------
#include <SoftwareSerial.h>

#define OPERATION_STEP_0  0
#define OPERATION_STEP_1  1
#define OPERATION_STEP_2  2
#define OPERATION_STEP_3  3
#define OPERATION_STEP_4  4
#define OPERATION_STEP_5  5
#define OPERATION_STEP_6  6
#define OPERATION_STEP_7  7
#define OPERATION_STEP_8  8

SoftwareSerial bleSerial(A0, A1); // RX, TX
//-----------------------------------------------
String uartString = "";
unsigned int currentStep;
unsigned int oldStep;
//-----------------------------------------------
void checkNextStep()
{
  delay(300);
  uartString = "";
  oldStep = currentStep;
  currentStep = OPERATION_STEP_0;
}
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
  
  currentStep = 1;
}

void loop()
{
  switch(currentStep)
  {
    case OPERATION_STEP_0:
      if(bleSerial.available())
      {
        char inChar = bleSerial.read();
        uartString += inChar;
        //
        if( uartString.length() > 4
         && uartString.startsWith("\r\n")
         && uartString.endsWith("\r\n") )
        {
          currentStep = oldStep;
          currentStep++;
        }
      }
    break;
    case OPERATION_STEP_1:
      Serial.println("Check Message Test 02");
      currentStep++;
    break;
    case OPERATION_STEP_2:
      if(!digitalRead(9))
      {
        Serial.println("Pressed Connect Button");
        bleSerial.print("atd");
        bleSerial.print("083a5c1f2053");
        bleSerial.print("\r");
        checkNextStep();
      }
    break;
    case OPERATION_STEP_3:
      if(uartString.equals("\r\nOK\r\n"))
      {
        Serial.println("Received OK");
        checkNextStep();
      }
    break;
    case OPERATION_STEP_4:
      if(uartString.startsWith("\r\nCONNECT "))
      {
        Serial.println("Received CONNECT");
        delay(300);
        uartString = "";
        currentStep++;
      }
    break;
    case OPERATION_STEP_5:
      if(bleSerial.available())
      {
        bleSerial.read();
      }
      
      if(!digitalRead(10))
      {
        Serial.println("Pressed Disconnect Button");
        bleSerial.print("ath");
        bleSerial.print("\r");
        checkNextStep();
      }
    break;
    case OPERATION_STEP_6:
      if(uartString.equals("\r\nOK\r\n"))
      {
        Serial.println("Received OK");
        checkNextStep();
      }
    break;
    case OPERATION_STEP_7:
      if(uartString.startsWith("\r\nDISCONNECT"))
      {
        Serial.println("Recieved DISCONNECT");
        bleSerial.print("at+btsts?\r");
        checkNextStep();
      }
    break;
    case OPERATION_STEP_8:
      if(uartString.startsWith("\r\nSTANDBY"))
      {
        Serial.println("Recieved STANDBY");
        delay(300);
        uartString = "";
        currentStep = OPERATION_STEP_2;
      }
    break;
  }
}
