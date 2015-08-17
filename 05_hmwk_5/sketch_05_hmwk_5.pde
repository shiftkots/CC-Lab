
//Global Variables

int Xpos; 
int Ypos; 
int myWidth;
int myHieght;
 
void setup() {
  size(610,610);
 
}
void draw() {
  background(255);
 
  myWidth = 50;
 
  myHieght = myWidth;
 
  Xpos = 10;
  Ypos = 10;
 
  for(int i = 1; i<=10; i++){
    noStroke();
    fill(i*20,i*20,180);
    rect(Xpos,Ypos,myWidth,myHieght);
    Xpos = Xpos+myWidth+10;
 
 
  }
}