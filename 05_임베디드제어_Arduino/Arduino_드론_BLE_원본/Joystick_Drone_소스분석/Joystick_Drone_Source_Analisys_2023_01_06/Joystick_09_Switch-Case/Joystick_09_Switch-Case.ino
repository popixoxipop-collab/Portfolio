//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
unsigned int currentStep;
//-----------------------------------------------
void setup()
{
  Serial.begin(9600);
  Serial.println("Switch-Case Test");

  currentStep = 1;
}

void loop()
{
  switch(currentStep)
  {
    case 1:
      Serial.println("case 1 Operation");
      currentStep = 5;
      delay(500);
    break;
    case 5:
      Serial.println("case 5 Operation");
      currentStep++;
      delay(500);
    break;
    default:
      Serial.println("Default Operation");
      delay(500);
    break;
  }
}

