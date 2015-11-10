//Global Variables
int x = 0;
int y = height/2;
int colorCounter;
int colorCounter2;
boolean mouseOnRight;
//Properties of my moving ball
int speed = 3;
int ellipseSize = 10;
//State Variable
int state = 0;
void setup(){
  size(500, 500);
//Intializing Variables
  colorCounter = 0;
  colorCounter2 = 0;
  mouseOnRight = false;
}


void draw(){
  background(60+colorCounter, 60-colorCounter, 60+colorCounter2);
  noStroke();
  fill(colorCounter, colorCounter2, 255-colorCounter);
  ellipse(x, y, ellipseSize, ellipseSize);
  
  if(state == 0){
    x = x + speed;
    y = y - speed;
    
    if(y < 0){
      x = width/2;
      state = 1;
    }
  }else if (state == 1){
    x = x + speed;
    y = y + speed;
    
    if(x > width){
      y = height/2;
      state = 2;
    }
  }else if (state == 2){
    x = x - speed;
    y = y + speed;
    
    if(y > height){
      x = width/2;
      state = 3;
    }
  }else if (state == 3){
    x = x - speed;
    y = y - speed;
    
    if(x < 0){
      y = height/2;
      state = 0;
    }
  }
  
  if(mouseY >= height/2 && mouseOnRight == false){
    mouseOnRight = true;
    colorCounter += 5;
    speed += 3;
  }
  if(mouseY <= height/2 && mouseOnRight == true){
    mouseOnRight = false;
    colorCounter2 += 5;
    speed -= 3;
  } 
   
}
