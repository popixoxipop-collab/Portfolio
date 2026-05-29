//-----------------------------------------------
//-----------------------------------------------
#include <SoftwareSerial.h>

SoftwareSerial bleSerial(A0, A1); // RX, TX
//-----------------------------------------------
unsigned char startBit = 0xf0;
unsigned char commandBit = 0xa1;
unsigned char roll = 100;
unsigned char pitch = 100;
unsigned char yaw = 100;
unsigned char throttle = 0;
unsigned char operationBit = 0x01;
unsigned char checkSum = 0;
//-----------------------------------------------
void checkThrottle()
{
  //throttle: 감소시 하강, 증가시 상승
  if(!digitalRead(6))
  {
    if(throttle > 59)
      throttle -= 20;
    else if(throttle > 3)
      throttle -= 4;
  }
  else if(!digitalRead(5))
  {
    if(throttle < 20)
      throttle = 20;
    else if(throttle < 181)
      throttle += 20;
  }
}

void checkCRC()
{
  checkSum = commandBit + roll + pitch + yaw + throttle + operationBit;
  checkSum = checkSum & 0x00ff;
}
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  bleSerial.begin(9600);
  bleSerial.print("at\r");
  bleSerial.setTimeout(2);
  bleSerial.readString();
  Serial.println("Data Packet Test 02");

  for(int i = 5; i < 11; i++)
  {
    pinMode(i,INPUT);
    digitalWrite(i,HIGH);
  }

  delay(500);

  bleSerial.print("atd");
  bleSerial.print("083A5C1F2053");
  bleSerial.print("\r");

  delay(500);
}

void loop()
{
  checkThrottle();
  //
  checkCRC();
  //
  bleSerial.print("at+writeh000d");
  //
  bleSerial.print("f0");
  bleSerial.print("a1");
  bleSerial.print("64");
  bleSerial.print("64");
  bleSerial.print("64");
  //
  if(throttle < 0x10)
    bleSerial.print("0" + String(throttle,HEX));
  else 
    bleSerial.print(String(throttle,HEX));
  //
  bleSerial.print("01");
  //
  if(checkSum < 0x10)
    bleSerial.print("0" + String(checkSum,HEX));
  else 
    bleSerial.print(String(checkSum,HEX));
  //
  bleSerial.print("\r");
  delay(100);
}
