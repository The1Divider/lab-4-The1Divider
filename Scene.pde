class Scene {
  Sprite[] sprites;
  int currentIndex, spriteCount;
  
  Scene(int spriteCount) {
    sprites = new Sprite[spriteCount];
    currentIndex = 0;
  }
  
  void add(Sprite sprite) {
    if (currentIndex + 1 > spriteCount) {
      System.out.printf("Tried to add %s to scene but ran out of indices", sprite.name);
    } else {
    sprites[currentIndex] = sprite;
    }
  }
  
  void update(int length) {
    for (Sprite sprite : sprites) {
      if (sprite.pos.y > length) {
        sprite.restart();
      }
    }
  }
}
