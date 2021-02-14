class Spaceship extends Sprite {

  Spaceship(String name, int x, int y) {
    setPos(x, y);
    setName(name);
    setSprite();
  }
  
  void update(int xDir, int yDir) {
    pos.x += xDir;
    pos.y += yDir;
    display();
  }
  
  void setSprite() {
    float x = pos.x;
    float y = pos.y;
    
    sprite = createShape();
    sprite.beginShape();
    
    sprite.fill(255);
    
    sprite.vertex(x, y);
    sprite.vertex(x+10, y);
    sprite.vertex(x+10, y+10);
    sprite.vertex(x, y+10);
    sprite.vertex(x, y);
    
    sprite.endShape(CLOSE);
  }
  
  void display() {
    shape(sprite);
  }
}
