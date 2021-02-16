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
    
    PShape sprite = createShape(GROUP);
    
    for (int i = 0; i < 12; i++) {
      PShape star = createShape();
      
      pushMatrix();
      
      star.beginShape();
      
      star.fill(255);
      star.vertex(0, 0);
      star.vertex(1, 0);
      star.endShape();
      
      rotate(2 * PI * (i/12));
      
      popMatrix();
      
      sprite.addChild(star);
    }
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
