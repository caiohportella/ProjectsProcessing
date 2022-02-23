class Cell {
  PVector pos;
  PVector vel;
  int maxSpeed;
  int maxForce;
  float rad;
  color colour;

  Cell(PVector pos, PVector vel, int speed, int force, float rad, color c) {
    this.pos = pos.copy();
    this.vel = vel;
    this.rad = rad;
    this.colour = c;
    this.maxSpeed = speed;
    this.maxForce = force;
  }

  Cell() {
    this.pos = new PVector(random(width), random(height));
    this.vel = PVector.random2D();
    this.maxSpeed = 10;
    this.maxForce = 1;
    this.rad = 60;
    this.colour =  color(random(100, 255), 0, random(100, 255), 100);
  }


  boolean clicked(int x, int y) {
    float d = dist(this.pos.x, this.pos.y, x, y);
    if (d < this.rad) {
      return true;
    } else {
      return false;
    }
  }

  Cell mitosis() {
    Cell cell = new Cell(this.pos, this.rad * 0.8, this.c);
    return cell;
  }
  
  PVector arriveSB(PVector target) {
    PVector desired = PVector.sub(target, this.pos);
    float d = desired.mag();
    float speed = this.maxSpeed;
    if (d < 100) {
      speed = map(d, 0, 100, 0, this.maxSpeed);
    }
    desired.setMag(speed);
    PVector steer = PVector.sub(desired, this.vel);
    steer.limit(this.maxForce);
    return steer;
  }

  void move() {
    PVector vel = PVector.random2D();
    this.pos.add(vel);
  }

  void show() {
    noStroke();
    fill(this.colour);
    ellipse(this.pos.x, this.pos.y, this.rad, this.rad);
  }
}
