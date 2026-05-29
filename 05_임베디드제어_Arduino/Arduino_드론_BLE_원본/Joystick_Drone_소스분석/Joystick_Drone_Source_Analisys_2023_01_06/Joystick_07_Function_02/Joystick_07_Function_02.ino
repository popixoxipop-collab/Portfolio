//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
void disp11111()
{
  Serial.println("11111");
}

void calculation()
{
  int a = 1;
  int b = 2;
  int c = 0;

  c = a+b;
  Serial.print("a+b=");
  Serial.println(c);
}
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("Function Test 02");

  disp11111();
  calculation();
}

void loop()
{
  
}

