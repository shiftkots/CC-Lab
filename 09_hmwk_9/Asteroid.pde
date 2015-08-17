class Asteroid {
  //data
  float x, y;
  float velocity;
  float w;
  //constructor
  Asteroid(float x, float y, float velocity) {
    this.x = x;//equals to x=_x;
    this.y = y;
    this.velocity = velocity;
    w = random(30, 100);
  }

  void display() {
    pushMatrix();//lock anything between this two
    translate(x, y);
    noFill();
    stroke(200, 255, 255, 180);
    ellipse(0, 0, w, w);
    popMatrix();
  }

  void update() {
    y += velocity;
  }

  void PlayerCollision(Player ship_, Asteroid asteroid_) {
    ship = ship_;
    if (dist(x, y, ship.x, ship.y) < w/2 + 5) {
      fill(255, 255, 255, 180);
      ellipse(ship.x, ship.y, 180, 180);
      ship.alive = false;
    }
  }
  
  void shotCollision(Shot shots, Asteroid asteroid, int asteroidIndex, int shotIndex) {
    if (dist(x, y, shots.x, shots.y) < w/2 + 2) {
      shots.remove(shotIndex);
      asteroids.remove(asteroidIndex);
      score++;
    }
  }
}  