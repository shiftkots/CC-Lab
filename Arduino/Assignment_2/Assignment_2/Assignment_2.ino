 //pin which triggers ultrasonic sound
const int trigPin = 13;
 
//pin which delivers time to receive echo using pulseIn()
int echoPin = 12;

//range in cm which is considered safe to enter, anything
//coming within less than 5 cm triggers red LED
int safeZone = 10;
 
//LED pin numbers
int greenLed = 3, redLed = 2;

const int buzzerPin = 9;

const int songLength = 4;
// Notes is an array of text characters corresponding to the notes
// in your song. A space represents a rest (no tone)

char notes[] = "cdc "; // a space represents a rest

// Beats is an array of values for each note and rest.
// A "1" represents a quarter-note, 2 a half-note, etc.
// Don't forget that the rests (spaces) need a length as well.

int beats[] = {5, 3, 5, 1};

// The tempo is how fast to play the song.
// To make the song play faster, decrease this value.

int tempo = 150;
 
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
  pinMode(buzzerPin, OUTPUT);

  int i, dure;
  for (i = 0; i < songLength; i++) // step through the song arrays
  {
    dure = beats[i] * tempo;  // length of note/rest in ms
    
    if (notes[i] == ' ')          // is this a rest? 
    {
      delay(dure);            // then pause for a moment
    }
    else                          // otherwise, play the note
    {
      tone(buzzerPin, frequency(notes[i]), dure);
      // wait for tone to finish
    }
    delay(tempo/10);              // brief pause between notes
  }

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
 
  // convert the time into a distance
  cm = microsecondsToCentimeters(duration);
 
  //printing the current readings to ther serial display
  Serial.print(cm);
  Serial.print("cm");
  Serial.println();
 
  //checking if anything is within the safezone, if not, keep
  //green LED on if safezone violated, activate red LED instead
  if (cm > safeZone)
  {
    digitalWrite(greenLed, HIGH);
    digitalWrite(redLed, LOW);
    digitalWrite(buzzerPin, LOW);
  }
  else
  {
    digitalWrite(redLed, HIGH);
    digitalWrite(greenLed, LOW);
    digitalWrite(buzzerPin, HIGH);
  }
  delay(100);
}
 
long microsecondsToCentimeters(long microseconds)
{
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}

int frequency(char note) 
{
  // This function takes a note character (a-g), and returns the
  // corresponding frequency in Hz for the tone() function.
  
  int i;
  const int numNotes = 2;  // number of notes we're storing

  char names[] = {'c', 'd'};
  int frequencies[] = {440, 330};
  
  // Now we'll search through the letters in the array, and if
  // we find it, we'll return the frequency for that note.
  
  for (i = 0; i < numNotes; i++)  // Step through the notes
  {
    if (names[i] == note)         // Is this the one?
    {
      return(frequencies[i]);     // Yes! Return the frequency
    }
  }
  return(0);  // We looked through everything and didn't find it,
              // but we still need to return a value, so return 0.
}
