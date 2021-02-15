class Star extends Sprite {
  boolean pulse;
  
  Star() {
    int x = (int) random(1, 20) * 50;
    pulse = random(1) > .5 ? true : false;
    setPos(x, 0);

    setSprite();
  }
  
  void update(int y) {
    pos.y += y;
    if (pos.y > height+50) {restart();}
    setSprite();
    pulse = pulse ? false : true; 
  }
  
  void setSprite() {
    float x = pos.x;
    float y = pos.y;
    
    sprite = createShape();
    sprite.beginShape();
    
    sprite.fill(255);
    
    sprite.vertex(x/2, y/2-50);
    sprite.bezierVertex(x/2, y/2, x/2, y/2, x/2 + 50, y/2);
    sprite.bezierVertex(x/2, y/2, x/2, y/2, x/2, y/2+50);
    sprite.bezierVertex(x/2, y/2, x/2, y/2, x/2 - 50, y/2);
    sprite.bezierVertex(x/2, y/2, x/2, y/2, x/2, y/2-50);
    
    if (pulse) {sprite.scale(1.2);};
    
    sprite.endShape();
  }
  
  void display() {
    shape(sprite);
  }
  
  void restart() {
    int x = (int) random(1, 20) * 50;
    pulse = random(1) > .5 ? true : false;
    setPos(x, 0);
    setSprite();
  }
}
