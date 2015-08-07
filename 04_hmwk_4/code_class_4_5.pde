float r = 100;
float j = 250;
float k = 75;
float theta = 0;

void setup(){
  size(500, 500);
  background(200, 200, 255);

}

void draw(){
  float y = r * cos(theta * 0.05);
  float x = r * sin(theta * 2);
  fill(240, 200, 0);
  noStroke();
  ellipse(x+width/2, y+height/2, 10, 10);
  
  float w = r * cos(theta * 2);
  float z = r * sin(theta * 0.05);
  fill(0, 200, 240);
  noStroke();
  ellipse(z+width/2, w+height/2, 10, 10);
  
  float m = k * cos(theta * 0.05);
  float n = j * sin(theta * 0.05);
  fill(255, 182, 193);
  noStroke();
  ellipse(n+width/2, m+75, 10, 10);
  
  float q = k * cos(theta * 0.05);
  float a = j * sin(theta * 0.05);
  fill(255, 182, 193);
  noStroke();
  ellipse(a+width/2, q+425, 10, 10);
  
  float s = j * sin(theta * 0.05);
  float d = j * sin(theta * 0.05);
  fill(193, 220, 179);
  noStroke();
  ellipse(s+width/2, d, 10, 10);
  
  float f = j * sin(theta * 0.05);
  float g = j * sin(theta * 0.05);
  fill(193, 220, 179);
  noStroke();
  ellipse(f+width/2, g+250, 10, 10);
  
  float t = j * sin(theta * 0.05);
  float c = j * sin(theta * 0.05);
  fill(193, 220, 179);
  noStroke();
  ellipse(t+width/2, c+500, 10, 10);
  
  theta += 1;

}
