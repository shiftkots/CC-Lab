//Global Variables
PImage myImage1;
int a;
int Pro;

void setup(){
  size(300, 300);
  myImage1 = loadImage("Mario.gif");
  background(0);
  a = 40;
  Pro = 0;
}

void draw(){
  
  int x = mouseX;
  
  int y = mouseY;
  
  int loc = x + (y*myImage1.width);

  if(x > 0 && y > 0 && Pro == 0){
    a += 5;
    Pro = 1;
  }else if(x > 150 && y > 150 && Pro == 1){
    a -= 5;
    Pro = 0;
  }
  loadPixels();
  
  float r = red(myImage1.pixels[loc]);
  
  float g = green(myImage1.pixels[loc]);
  
  float b = blue(myImage1.pixels[loc]);
  
  updatePixels();
  
  noStroke();
  
  fill(r, g, b, 100);
  
  ellipse(x, y, 50, 50);
}

