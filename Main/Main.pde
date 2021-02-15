boolean mouseControl;
boolean selection = false;
Spaceship spaceship;
PImage planet1, planet2, planet3;
Scene scene;

void setup() {
  size(1000, 1000);
  background(0);
  
  spaceship = new Spaceship(width/2, height/2);
  
  planet1 = loadImage("planet1.jpg");
  planet2 = loadImage("planet2.jpg");
  planet3 = loadImage("planet3.jpg");
  
  PImage[] planetChoices = {planet1, planet2, planet3};
  scene = new Scene(planetChoices, 10, 3);
}
// Planets:
// load 3-5 images + manipulate for 'different' planets
// scene vertically scrolls
// planet.isOutOfBounds -> checks if planet sprite is still on screen,
// if not pop out of sprite array + generate new one
// gen method should use a rng method to keep clean

// Spaceship:
// give option to control with WASD or mouse (???)
// left click fires text "pew" at a interval
// right click fires text "pew" per tick

// Stars: (???)
// 4 bezierVertex curves
// scale up and down to give 'shining' affect

void draw() {
  background(0);
  
  if (!selection) {
    controlSelection();
  } else {
    spaceship.display();
    scene.display();
    updateSpaceship();
    scene.update();
  }
}

void controlSelection() {
  rectMode(CENTER);
  textAlign(CENTER);
  stroke(255);
  
  // Mouse selection button
  fill(170, 170, 170);
  rect(width/3, height/2, 200, 200);
  fill(0);
  text("Mouse", width/3, height/2);
  
  // Keyboard selection button
  fill(170, 170, 170);
  rect(width/3*2, height/2, 200, 200);
  fill(0);
  text("Keyboard", width/3*2, height/2);
  
  boolean inButton1XRange = (mouseX > width/3 - 100 && mouseX < width/3 + 100);
  boolean inButton1YRange = (mouseY > height/2 - 100 && mouseY < height/2 + 100);
  
  boolean inButton2XRange = (mouseX > width/3*2 - 100 && mouseX < width/3*2 + 100);
  boolean inButton2YRange = (mouseY > height/3 - 100 && mouseY < height/2 + 100);
  
  if (mousePressed == true && inButton1XRange && inButton1YRange) {
    selection = true;
    mouseControl = true;
  } else if (mousePressed == true && inButton2XRange && inButton2YRange) {
    selection = true;
    mouseControl = false;
  }
}

void updateSpaceship() {
  if (mouseControl == true) {
    spaceship.update(mouseX, mouseY, mouseControl);
  } else if (keyPressed) {
    System.out.println("Here");
    int xDir = 0, yDir = 0;
    // add collision
    if (keyPressed && key == 'w') {
      yDir = -5;
    } 
    if (keyPressed && key == 'a') {
      xDir = -5;
    } 
    if (keyPressed && key == 's') {
      yDir = 5;
    } 
    if (keyPressed && key == 'd') {
      xDir = 5;
    }
    spaceship.update(xDir, yDir, mouseControl);
  }
}
