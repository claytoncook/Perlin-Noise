ArrayList points = new ArrayList();
float scl = 0.05;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  strokeWeight(1);
  for (int f=0; f<10; f++) {
    points.add(new Point());
  }
  for (int i=points.size()-1; i>0; i--) {
    Point p = (Point)points.get(i);
    p.update();
  }
}

class Point {
  float x, y, xv = 0, yv = 0;
  float xoff = 50;
  float yoff = 0;
  float zoff = 100;

  Point() {
    x = random(width);
    y = random(height);
  } 

  void update() {
    stroke(xoff, yoff, zoff, 15);
    xv = cos(noise(scl * x, scl * y) * PI);
    yv = -sin(noise(scl * x, scl * y) * PI);

    if (x >= width) {
      x = 0;
    }

    if (x <= 0) {
      x = width;
    }

    if (y >= height) {
      y = 0;
    }

    if (y <= 0) {
      y = height;
    }

    x += xv;
    y += yv;
    if (xoff >= 255) {
      xoff = 0;
    }

    if (yoff >= 255) {
      yoff = 0;
    }

    if (zoff >= 255) {
      zoff = 0;
    }

    point(x + noise(10), y + noise(10));
    xoff+= 5;
    yoff+= 4;
    zoff+= 3;
  }
}
