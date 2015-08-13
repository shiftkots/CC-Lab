int numElements = 2000;
int opacity;
Pixel [] pixel = new Pixel[numElements];

void setup(){
  size(500, 500);
  
  for(int i = 0; i < numElements; i++){
    pixel[i] = new Pixel(250,250,10,10,255,255,255);
  }
}

void draw(){
  background(random(220,255));
  
  for(int i = 0; i < numElements; i++){
    pixel[i] = new Pixel(random(0,500),random(0,500),random(1,20),random(1,20),random(255),random(255),random(255));
  }

  for(int i = 0; i < numElements; i++){
    pixel[i].display();
    pixel[i].move();
    pixel[i].bound();
  }
}