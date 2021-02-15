class Sprite {
  PVector pos; 
  String name;
  PShape sprite;
  
  void setPos(int x, int y) {
    pos = new PVector(x, y);
  }
  
  PVector getPos() {
    return pos;
  }
  
  void setSprite() {}
  void update() {}
  void display() {}
  void restart() {}

}
