class Bloon {
  //Member Variables
  int w;
  int h;
  int x;
  int y;
  int speed;
  int tier;
  int distTraveled;
  //float midx, midy,r;
  PImage bloon;
  color c;
  char direction;
  //Contructor
  Bloon(int x, int y, int tier, char direction) {
    this.x=x;
    this.y=y;
    this.tier=tier;
    this.direction=direction;
    w=30;
    h=40;
    distTraveled=0;
    //midx=x+w/2;
    //midy=y+h/2;
    bloon = loadImage("bloon.png");
    bloon.filter(THRESHOLD, 0.1);
    switch(tier) {
    case 1:
      c=#FF0000;
      speed=1;
      break;
    case 2:
      c=#0000FF;
      speed=2;
      break;
    case 3:
      c=#00FF00;
      speed=3;
      break;
    case 4:
      c=#F0F000;
      speed=5;
      //println("test");
      break;
    case 5:
      c=#F000F0;
      speed=7;
      break;
    }
  }
  //Member Methods
  //I think it is more appropriate to call it spawn but it is functionally just a
  //display & move methods
  void spawn() {
    tint(c);
    //println(color(c));
    image(bloon, x, y, w, h);
    //fill(255);
    //ellipse(x+w/2,y+h/2,w,h);
  }
  void move() {
    switch (direction) {
    case 'r':
      x+=speed;
      break;
    case 'l':
      x-=speed;
      break;
    case 'u':
      y-=speed;
      break;
    case 'd':
      y+=speed;
      break;
    }
    distTraveled+=speed;
  }
  boolean reachedEnd() {
    if (x>width || y> height||y<0||x<0) {
      println("bloon removed");
      return true;
    } else {
      return false;
    }
  }
  void hit(int t) {
  switch(t) {
    case 1:
      c=#FF0000;
      speed=1;
      
      break;
    case 2:
      c=#0000FF;
      speed=2;
      
      break;
    case 3:
      c=#00FF00;
      speed=3;
      
      break;
    case 4:
      c=#F0F000;
      speed=5;
      
      //println("test");
      break;
    case 5:
      c=#F000F0;
      speed=7;
      
      break;
    }
  }
}
