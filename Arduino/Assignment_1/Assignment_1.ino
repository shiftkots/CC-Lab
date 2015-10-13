const int ledPin1 = 13;
int led2 = 12;
int buttonPin1 = 2;
int buttonPin2 = 4;
int buttonState1 = 0;
int buttonState2 = 0;
int ledState = LOW;
unsigned long previousMillis = 0;
long interval;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  buttonState1 = digitalRead(buttonPin1);
  buttonState2 = digitalRead(buttonPin2);
  if(buttonState2 == HIGH){
      interval = 100;
    }else{
      interval = 1000;
    }
  unsigned long currentMillis = millis();
  if(currentMillis - previousMillis >= interval){
    previousMillis = currentMillis;
    if(ledState == LOW){
      ledState = HIGH;
    }else{
      ledState = LOW;
    }
  }
  if(buttonState1 == HIGH){
    digitalWrite(led2, HIGH);
    digitalWrite(ledPin1, ledState);
  }else{
    digitalWrite(led2, LOW);
    digitalWrite(ledPin1, LOW);
  }
}
