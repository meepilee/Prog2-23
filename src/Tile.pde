class Tile {
  int x, y;
  char type;
  boolean hasMonkey;
  color c;

  Tile(int x, int y, char type, boolean hasMonkey) {
    this.x=x;
    this.y=y;
    this.type=type;
    this.hasMonkey=hasMonkey;
    switch (type) {
    case 'l':
      c=#00FF00;
      break;
    case 'r':
      c=#08a4ff;
      break;
    case 't':
      c=#7a4a20;
      break;
    }
  }



  void display () {
    fill(c);
    rect(x, y, 50, 50);
  }
  boolean hovering () {
    if (mouseX>=x && mouseX<=x+50 && mouseY>=y && mouseY<=y+50) {
      return true;
    } else {
      return false;
    }
  }
}
