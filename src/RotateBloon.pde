class RotateBloon {
  float x;
  float y;
  PImage sprite;
  char direction;



  RotateBloon (float x, float y, char direction) {
    this.x=x;
    this.y=y;
    this.direction=direction;
    sprite = loadImage("rotate.png");
    sprite.resize(100, 100);
  }
  void display () {
    fill(255);
    ellipse(x, y, 25, 25);
  }
  boolean bloonTouching(Bloon b) {
  
      if (x>=b.x && x<=b.x+b.w && y>=b.y && y<=b.y+b.h) {
        return true;
      } else {
        return false;
      }
    
  }
  char rotate(char d) {
    if (direction=='r') {
      println("1");
      if (d=='u') {
        println("2");
        return 'r';
      } else if (d=='r') {
        println("3");
        return 'd';
      } else if (d=='d') {
        println("4");
        return 'l';
      } else {
        println("5");
        return 'u';
      }
    } else if (direction=='l') {
      println("6");
      if (d=='u') {
        println("7");
        return 'l';
      } else if (d=='r') {
        println("8");
        return 'u';
      } else if (d=='d') {
        println("9");
        return 'r';
      } else {
        println("10");
        return 'd';
      }
    } else {
      println("stoopid");
      return 'e';
    }
  }
}
