
void setup() {
  Serial.begin(9600);
  Serial.println("Print String Test 02");
}

void loop() {
  for(unsigned char i = 0; i < 201; i++)
  {
    if(i < 0x10)
      Serial.print("0"+String(i,HEX));
    else
      Serial.print(String(i,HEX));
    //
    Serial.print("    ");
    Serial.println(String(i));
    delay(300);
  }
}
