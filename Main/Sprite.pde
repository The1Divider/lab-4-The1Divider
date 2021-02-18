class Sprite {
  PVector pos; 
  String name;
  PShape sprite;
  color sprite_colour;
  
  void setPos(int x, int y) {
    pos = new PVector(x, y);
  }
  
  PVector getPos() {
    return pos;
  }
  
  void setSprite() {}
  
  void update(int y_add, int y_limit) {
    pos.y += y_add;
    if (pos.y > height + y_limit) {restart();}
    setSprite();
  }
    
  void display() {}
  void restart() {}

}
