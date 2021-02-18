class Star extends Sprite {

  PShape sprite;
  
  Star() {
    int x = (int) random(width);
    int y = (int) random(-height, 0);
    setPos(x, y);
    setSprite();

  }
  
  void setSprite() {
    int star_size = 25;
    int prongs = 8;
    
    pushMatrix();
    translate(pos.x, pos.y);
    strokeWeight(1);
    stroke(255);
    for (int i = 0; i <= prongs; i++) {
      line(0, 0, star_size, 0);
      rotate(radians((360/prongs)*i));
    }
    popMatrix();
  }
  
  void display() {
    setSprite();
  }
  
  void restart() {
    int x = (int) random(width);
    int y = (int) random(-height, 0);
    setPos(x, y);
    
  }
}
