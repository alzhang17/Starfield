Particle[] dots = new Particle[1000];


void setup() {
  size(500, 500);
  for (int i = 0; i < dots.length-300; i++)
    dots[i] = new Particle();
  for (int i = dots.length-300; i < dots.length; i++)
    dots[i] = new oddParticle();
}
void draw() {
  background(0);
  for (int i = 0; i < dots.length; i++) {
    dots[i].show();
    dots[i].move();
  }
}

class Particle {
  double myX, myY, X, Y, mySpeed, myAngle, radius;
  int myColor, myWidth, myHeight;
  Particle() {
    myX =  width/2;
    myY =  height/2;
    myWidth = 5;
    myHeight = 5;
    myAngle = Math.random()*2*PI;
    mySpeed = Math.random()*5+1;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256) );
    radius = 50 * Math.sqrt(Math.random());
  }

  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, myWidth, myHeight);
  }
  void move() {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    if ((myX > 500 && myY > 500) || (myX < 0 && myY < 0) || (myX < 0 && myY > 500) || (myX > 500 && myY < 0)) {
      myAngle = Math.random()*2*PI;
      X = (width/2) + 60 * Math.cos(myAngle); 
      Y = (height/2) + 60 * Math.sin(myAngle);
      myX = (float)X;
      myY = (float)Y;
    }
  }
}

class oddParticle extends Particle{
  oddParticle(){
    myColor = color(255,255,255);
    radius = 100 * Math.sqrt(Math.random());
    myWidth = 7;
    myHeight = 7;
  }
}

void mousePressed() {
  for (int i = 0; i < dots.length; i++)
    dots[i] = new Particle();
}
