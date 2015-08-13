//Global Variables

int numBalls = 100;
int magicRadius = 50;

int [] ballsX = new int[numBalls];
int [] ballsY = new int[numBalls];

int [] xSpeed = new int[numBalls];
int [] ySpeed = new int[numBalls];

int [] radius = new int[numBalls];

color [] baseColor = new int[numBalls];
color [] drawColor = new int[numBalls];
int [] opacity = new int [numBalls];

void setup(){
  size(500, 500);

  for(int i = 0; i < numBalls; i++){
    ballsX[i] = int(random(mouseX-30, mouseX+30));
    ballsY[i] = int(random(mouseY-30, mouseY+30));
    
    xSpeed[i] = int(random(-5, 5));
    ySpeed[i] = int(random(-5, 5));
    
    if(xSpeed[i] == 0){
      xSpeed[i] = 3;
    }
    if(ySpeed[i] == 0){
      ySpeed[i] = 1;
    }
    
    radius[i] = int(random(0, 10));
    baseColor[i] = color(random(255),random(255),random(255));
    drawColor[i] = color(baseColor[i], opacity[i]);
    opacity[i] = 255;
  }
}

void draw(){
  background(random(255));
  
  update();
  drawBalls();
  ballBoundry();
  ballInteraction();
}

void drawBalls(){
  noStroke();
  for(int i = 0; i < numBalls; i++){
    fill(drawColor[i]);
    drawColor[i] = color(baseColor[i], opacity[i]);
    ellipse(ballsX[i], ballsY[i], radius[i]*2, radius[i]*2);
  }
}

void update(){
  for(int i = 0; i < numBalls; i++){
    ballsX[i] = ballsX[i] + xSpeed[i];
    ballsY[i] = ballsY[i] + ySpeed[i];
    radius[i] = radius[i] + xSpeed[i];
  }
}

void ballBoundry(){
  for(int i = 0; i < numBalls; i++){
    if(ballsX[i] < mouseX-30){
      xSpeed[i] = xSpeed[i] * -1;
      ballsX[i] = mouseX-30;
    }
    if(ballsX[i] > mouseX+30){
      xSpeed[i] = xSpeed[i] * -1;
      ballsX[i] = mouseX+30;
    }
    if(ballsY[i] < mouseY-30){
      ySpeed[i] = ySpeed[i] * -1;
      ballsY[i] = mouseY-30;
    }
    if(ballsY[i] > mouseY+30){
      ySpeed[i] = ySpeed[i] * -1;
      ballsY[i] = mouseY+30;
    }
  }
  
}

void ballInteraction(){
  for(int i = 0; i < numBalls; i++){
      opacity[i] = int(random(0, 255));
  }
}
