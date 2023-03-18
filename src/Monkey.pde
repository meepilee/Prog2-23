class Monkey {
  int x, y;
  int cd;
  int cost;
  int range;
  int pspeed;
  int pdmg;
  int ppierce;
  Projectile p;
  Monkey (int x, int y) {
    this.x=x;
    this.y=y;
    range=200;
    pspeed=10;
    pdmg=1;
    ppierce=3;
    //p=new Projectile();
  }
  void display () {
    fill(#3b1f08);
    ellipse(x, y, 45, 45);
  }
  boolean bloonInRange(Bloon b) {
  
      if (dist(x,y,b.x,b.y)<range||dist(x,y,b.x+b.w,b.h+b.y)<range) {
        return true;
      } else {
        return false;
      }
    
  }
  
}
