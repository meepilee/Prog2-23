class Projectile {
  Monkey m;
  Bloon b;
  float xxx, yyy;
  float x, y;
  float bx, by, mx, my;
  int pierce;
  Projectile (Monkey m, Bloon b) {
    this.m=m;
    this.b=b;
    pierce=m.ppierce;
    x=m.x;
    y=m.y;
    bx=b.x+b.w/2;
    by=b.y+b.h/2;
    mx=m.x+21;
    my=m.y+21;
    float xx=bx-mx;
    float yy=by-my;
    xxx=cos(atan2(yy,xx))*m.pspeed;
    yyy=sin(atan2(yy,xx))*m.pspeed;
  }
  void display () {
    fill(0);
    quad(x-10,y-10,x+10,y-10,x+10,y+10,x-10,y+10);
  }
  void move() {
    x+=xxx;
    y+=yyy;
  }
  boolean reachedEnd() {
    if (x>displayWidth || y> displayHeight||y<0||x<0) {
      println("projectile removed");
      return true;
    } else {
      return false;
    }
  }
  boolean bloonTouching(Bloon b) {
  
      if (x>=b.x && x<=b.x+b.w && y>=b.y && y<=b.y+b.h) {
        return true;
      } else {
        return false;
      }
    
  }
}
