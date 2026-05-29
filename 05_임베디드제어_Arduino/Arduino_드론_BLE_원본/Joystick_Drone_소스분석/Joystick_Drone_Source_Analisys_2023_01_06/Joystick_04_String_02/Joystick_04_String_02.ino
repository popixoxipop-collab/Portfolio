//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
String testString = "";
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("String Test 02");

  testString = "1234567890";
  Serial.println(testString);

  testString = "abc";
  Serial.println(testString);
}

void loop()
{
  
}

