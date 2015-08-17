void setup(){

  size(800, 800);
  background(255);
  noFill();
  smooth();
 
}

void draw(){
  for (int x = 0; x<800; x += 3) {
    float n = norm(x, 0.0, 100.0);
    float y = pow(n, 3);
 
    stroke(81, 255, 163);
    strokeWeight(n/20);
    beginShape();
    vertex(150, 325);
    bezierVertex(y-300, x+250, 600, 600-n, x+350, y+48);
    endShape();
  }
  
  for (int x=10 ; x<800; x += 4) {
    float n = norm(x, 10.0, 94.0);
    float y = pow(n, 2);
 
    stroke(166, 145, 255);
    strokeWeight(n/30);
    beginShape();
    vertex(375, 294);
    bezierVertex((x/2)+70, y, n, x-100, 600-x, 400-(y*3));
    endShape();
  }
}