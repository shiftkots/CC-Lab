float x;
float y;
float x1;
float y1;
float r;
float g;
float b;
float xSpeed = 0.001;
float ySpeed = 0.005;

class Pixel{
  
  Pixel(float x_, float y_, float x1_, float y1_, float r_, float g_, float b_){
    x = x_;
    y = y_;
    x1 = x1_;
    y1 = y1_;
    r = r_;
    g = g_;
    b = b_;
  }

  void move(){
    x = x + xSpeed;
    y = y + ySpeed;
  }

  void display(){
    noStroke();
    fill(r,g,b);
    rect(x, y, x1, y1);
  }

  void bound(){
    for(int i = 0; i < numElements; i++){
      if(x > width){
        xSpeed = xSpeed * -1;
        x = width - x1;
    }
    if(x < x1){
      xSpeed = xSpeed * -1;
      x = x1;    
    }
    if(y < y1){
      ySpeed = ySpeed * -1;
      y = y1;
    }
    if(y > height){
      ySpeed = ySpeed * -1;
      y = height - y1;
    }
  }    
}

}