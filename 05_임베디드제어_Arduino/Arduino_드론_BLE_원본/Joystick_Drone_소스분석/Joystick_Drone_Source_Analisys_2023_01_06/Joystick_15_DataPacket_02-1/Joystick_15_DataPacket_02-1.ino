
void setup() {
  Serial.begin(9600);
  Serial.print("Print String Test 01");
}

void loop() {
  for(unsigned char i = 0; i < 201; i++)
  {
    Serial.print(String(i,HEX));
    Serial.print("    ");
    Serial.println(String(i));
    delay(300);
  }
}
