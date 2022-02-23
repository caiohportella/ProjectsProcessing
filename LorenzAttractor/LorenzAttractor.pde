import peasy.*;

PeasyCam cam;

ArrayList<PVector> points = new ArrayList<PVector>();

float x = 0.01;
float y = 0.0;
float z = 0.0;
  
float sigma = 10;
float ro = 28;
float beta = 8.0/3.0;

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);

  float dt = 0.01;
  float dx = (sigma * (y - x)) * dt;
  float dy = (x * (ro - z) - y) * dt;
  float dz = (x * y - beta * z) * dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points.add(new PVector(x, y, z));
  
  translate(0, 0, -80);
  stroke(255);
  scale(5);
  noFill();
  
  float hue = 0; //red
  
  beginShape();
  for(PVector v : points) {
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    hue += 0.1;

    if(hue > 255) {
      hue = 0;
    }
  }
  endShape();
}
