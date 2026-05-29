//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
unsigned char data1 = 0x00;
unsigned char data2 = 0x00;
unsigned char data3 = 0x00;
unsigned char data4 = 0x00;
unsigned char data5 = 0x00;
unsigned char data6 = 0x00;
unsigned char checkSum = 0;
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("Checksum Test 01");

  for(data1 = 0; data1 < 20; data1++)
  {
    checkSum = data1 + data2 + data3 + data4 + data5 + data6;
    checkSum = checkSum & 0x00ff;
    Serial.println(String(checkSum,HEX));
    delay(100);
  }
}

void loop()
{
}

