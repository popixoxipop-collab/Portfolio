//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
unsigned char data1 = 0xa1;
unsigned char data2 = 0x64;
unsigned char data3 = 0x64;
unsigned char data4 = 0x64;
unsigned char data5 = 0x78;
unsigned char data6 = 0x01;
unsigned char checkSum = 0;
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("Checksum Test 02");
}

void loop()
{
  checkSum = data1 + data2 + data3 + data4 + data5 + data6;
  checkSum = checkSum & 0x00ff;
  Serial.println(String(checkSum,HEX));
  delay(500);
}

