class Scene {
  Star[] stars;
  Planet[] planets;
  int currentIndex;
  
  Scene(PImage[] planetChoices, int starCount, int planetCount) {
    
    stars = new Star[starCount];
    
    for (int i = 0; i < starCount; i++) {

      Star star = new Star();
      star.display();
      stars[i] = star;
    }
    
    planets = new Planet[planetCount];
    
    for (int i = 0; i < planetCount; i++) {
      Planet planet = new Planet(planetChoices);
      planet.display();
      planets[i] = planet;
    }
  }
  
  void update() {
    for (Planet planet : planets){
      planet.update(5, 100);
    }
    for (Star star : stars) {
      star.update(5, 50);

    }
  }
  
  void display() {
    for (Star star : stars) {
      star.display();
    }
  }
}
