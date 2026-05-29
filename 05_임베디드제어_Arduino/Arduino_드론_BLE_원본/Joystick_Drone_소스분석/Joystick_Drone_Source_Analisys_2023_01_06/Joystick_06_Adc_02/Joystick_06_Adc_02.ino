//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("Adc Test 02");
}

void loop()
{
  unsigned int adc4 = analogRead(4);
  unsigned int adc5 = analogRead(5);

  Serial.print("adc4 = ");
  Serial.print(adc4);
  Serial.print("   adc5 = ");
  Serial.println(adc5);
  delay(500);
}

