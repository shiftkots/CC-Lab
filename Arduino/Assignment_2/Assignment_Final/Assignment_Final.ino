 //pin which triggers ultrasonic sound
const int trigPin = 13;
 
//pin which delivers time to receive echo using pulseIn()
int echoPin = 12;
 
//range in cm which is considered safe to enter, anything
//coming within less than 5 cm triggers red LED
long safeZone = 12.5;
 
//LED pin numbers
int greenLed = 3, redLed = 2;
int greenState = LOW;
int redState = LOW;

//Buzzer pin number
int tonePin = 4;
int proximity = 0;
int distance;

int buttonPin = 8;

int buttonPushCounter = 0; 
int buttonState = 0; 
int lastButtonState = LOW;

void setup() {
  // initialize serial communication
  Serial.begin(9600);
}

void loop()
{
  //raw duration in milliseconds, cm is the
  //converted amount into a distance
  long duration, cm;
 
  //initializing the pin states
  pinMode(trigPin, OUTPUT);
  pinMode(greenLed, OUTPUT);
  pinMode(redLed, OUTPUT);
  pinMode(tonePin, OUTPUT);  
  pinMode(buttonPin, INPUT);
  
  //sending the signal, starting with LOW for a clean signal
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(trigPin, LOW);
 
  //setting up the input pin, and receiving the duration in
  //microseconds for the sound to bounce off the object infront
  pinMode(echoPin, INPUT);
  duration = pulseIn(echoPin, HIGH);
  distance = (duration/2) / 29.1;
 
  // convert the time into a distance
  cm = microsecondsToCentimeters(duration);
 
  //printing the current readings to ther serial display
  Serial.print(cm);
  Serial.print("cm");
  Serial.println();

  //checking if anything is within the safezone, if not, keep
  //green LED on if safezone violated, activate red LED instead
  buttonState = digitalRead(buttonPin);
  if (buttonState != lastButtonState) {
    if (buttonState == HIGH) {
      buttonPushCounter++;
    }
  }
  
  if (buttonPushCounter % 2 == 0){
    greenState = LOW;
    redState = LOW;
    digitalWrite(tonePin, LOW);
  }
  else
  {
    if (cm > safeZone)
    {
      greenState = HIGH;
      redState = LOW;
    }
    else
    {
      redState = HIGH;
      greenState = LOW;
    }
    delay(100);

    proximity = map(distance, 0, 45, 8, 0);
    //Serial.println(proximity);
  
    if (proximity >= 7 && proximity <= 8){
      tone(tonePin, 200000, 200);
    }
    delay(200);
    noTone(tonePin);
  }
  digitalWrite(greenLed, greenState);
  digitalWrite(redLed, redState);
}

long microsecondsToCentimeters(long microseconds)
{
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}
