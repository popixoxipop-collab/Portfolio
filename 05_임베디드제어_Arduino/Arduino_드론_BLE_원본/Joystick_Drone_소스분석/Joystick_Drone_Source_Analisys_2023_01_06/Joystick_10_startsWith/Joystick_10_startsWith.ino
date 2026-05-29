//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
String testString = "1234567890";
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("startsWith Test");

  Serial.print("Length: ");
  Serial.println(testString.length());

  if(testString.startsWith("123"))
  {
    Serial.println("Start OK");
  }
  
  if(testString.endsWith("890"))
  {
    Serial.println("End OK");
  }
}

void loop()
{
}

