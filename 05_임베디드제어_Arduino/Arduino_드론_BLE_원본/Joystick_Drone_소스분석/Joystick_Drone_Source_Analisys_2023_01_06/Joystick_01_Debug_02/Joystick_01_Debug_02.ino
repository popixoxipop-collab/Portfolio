//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
unsigned int i;
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("Debug Test 02");
}

void loop()
{
  Serial.print(i);
  i++;
  if(i > 10)
  {
    i = 0;
    Serial.println();
    Serial.println("Serial Test");
  }
  delay(300);
}

