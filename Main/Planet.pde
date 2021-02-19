class Planet extends Sprite {
  PImage sprite;
  PImage[] planets;
  boolean rings;
  
  Planet(PImage[] planets) {
    this.planets = planets;
    sprite = planets[(int) random(3)];
    sprite_colour = color((int) random(360), 80, 99);
    int x = (int) random(width);
    int y = (int) random(-height, 0);
    setPos(x, y);
    rings = random(1) > .5;
  }
  
  void update(int y_add, int y_limit) {
    pos.y += y_add;
    if (pos.y > height + y_limit) {restart();}
    display();
  }
  
  void display() {
    pushMatrix();
    colorMode(HSB);
    tint(sprite_colour);
    image(sprite, pos.x, pos.y);
    if (rings) {
      rings();
    }
    popMatrix();
  }

  void rings() {}
  
  void restart() {
    sprite = planets[(int) random(3)];
    sprite_colour = color((int) random(360), 80, 99);
    int x = (int) random(width);
    int y = (int) random(-height, 0);
    setPos(x, y);
    rings = random(1) > .5;
    
  }
}
