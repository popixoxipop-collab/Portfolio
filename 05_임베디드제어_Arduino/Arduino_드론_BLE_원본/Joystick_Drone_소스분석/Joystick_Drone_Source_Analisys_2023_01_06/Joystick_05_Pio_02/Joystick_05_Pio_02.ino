//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("PIO Test 02");

  for(int i = 5; i < 11; i++)
  {
    pinMode(i,INPUT);
    digitalWrite(i,HIGH);
  }
}

void loop()
{
  if(!digitalRead(5))
  {
    Serial.println("Press 5");
  }
  if(!digitalRead(6))
  {
    Serial.println("Press 6");
  }
  if(!digitalRead(7))
  {
    Serial.println("Press 7");
  }
  if(!digitalRead(8))
  {
    Serial.println("Press 8");
  }
  if(!digitalRead(9))
  {
    Serial.println("Press 9");
  }
  if(!digitalRead(10))
  {
    Serial.println("Press 10");
  }
}

