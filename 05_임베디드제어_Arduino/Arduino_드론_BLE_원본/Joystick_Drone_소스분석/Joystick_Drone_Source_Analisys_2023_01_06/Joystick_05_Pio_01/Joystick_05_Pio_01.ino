//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("PIO Test 01");

  for(int i = 5; i < 11; i++)
  {
    pinMode(i,INPUT);
    digitalWrite(i,HIGH);
  }
}

void loop()
{
  if(!digitalRead(9))
  {
    Serial.println("Press 9");
  }
}

