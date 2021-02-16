class Scene {
  Star[] stars;
  Planet[] planets;
  int currentIndex, spriteCount;
  
  Scene(PImage[] planetChoices, int starCount, int planetCount) {
    stars = new Star[starCount];
    
    for (int i = 0; i < starCount; i++) {
      Star star = new Star();
      star.display();
      stars[i] = star;
    }
    
    planets = new Planet[planetCount];
    currentIndex = 0;
  }
  
  void update() {
    for (Star star : stars) {
      star.update(1);

    }
  }
  
  void display() {
    for (Star star : stars) {
      star.display();
    }
  }
}
