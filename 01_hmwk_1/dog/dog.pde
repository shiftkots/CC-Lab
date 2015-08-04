void setup(){
  size(500,500);


}


void draw(){
  background(245,220,10);
  
  //system variable
  rectMode(CENTER);
  noFill();
  //fill(0);
  stroke(34, 34, 34);
  strokeWeight(5);
  rect(width/2, height/2, 400, 400);
  
  //Draw a dog
  noStroke();
  //ears
  fill(0);
  triangle((width/2)-100, (height/2)-120, (width/2)-50, (height/2)-60, (width/2)-150, (height/2)-80);
  rect((width/2)-130, (height/2)-30, 40, 100);
  triangle((width/2)+20, (height/2)-35, (width/2)+105, (height/2)-150, (width/2)+165, (height/2)-115);
  //dog's tongue
  fill(200, 60, 70);
  rect(width/2, (height/2)+135, 55, 38);
  ellipse(width/2, (height/2)+154, 55, 38);
  fill(200, 40, 50);
  rect(width/2, (height/2)+135, 5, 38);
  //sounds
  fill(150, 150, 150);
  triangle((width/2)+85, (height/2)-63, (width/2)+135, (height/2)-80, (width/2)+138, (height/2)-73);
  triangle((width/2)+86, (height/2)-60, (width/2)+138, (height/2)-63, (width/2)+139, (height/2)-56);
  triangle((width/2)+87, (height/2)-57, (width/2)+139, (height/2)-48, (width/2)+137, (height/2)-42);
  //head
  fill(255);
  ellipse(width/2, height/2, 200, 200);
  //dog's muzzle
  ellipse(width/2, (height/2)+65, 150, 140);
  //one patch
  fill(70, 150, 60);
  ellipse((width/2)-45, (height/2)-20, 75, 50);
  //dog's eyes
  fill(0);
  ellipse((width/2)-45, (height/2)-20, 20, 20);
  ellipse((width/2)+45, (height/2)-20, 20, 20);
  //dog's nose
  ellipse(width/2, (height/2)+88, 55, 45);
  //dog's beard
  fill(100, 100, 100);
  ellipse((width/2)-37, (height/2)+77, 5, 5);
  ellipse((width/2)-49, (height/2)+67, 5, 5);
  ellipse((width/2)-45, (height/2)+87, 5, 5);
  ellipse((width/2)+37, (height/2)+77, 5, 5);
  ellipse((width/2)+49, (height/2)+67, 5, 5);
  ellipse((width/2)+45, (height/2)+87, 5, 5);

  


}
