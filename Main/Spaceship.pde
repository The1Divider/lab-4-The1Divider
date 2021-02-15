class Spaceship extends Sprite {

  Spaceship(int x, int y) {
    setPos(x, y);
    setSprite();
  }
  
  void update(int x, int y, boolean mouseControl) {
    if (mouseControl) {
      pos.x = x;
      pos.y = y;
    } else {
      System.out.println("hjere2");
      pos.x += x;
      pos.y += y;
    }
    setSprite();
  }
  
  void setSprite() {
    float x = pos.x;
    float y = pos.y;
    
    float coneHeight = 70;

    
    PVector body = new PVector(30, 50);
    
    PVector coneNose = new PVector(x, y - body.y - coneHeight);
    PVector coneCurve = new PVector(1, 1);
    
    
    PVector leftWingTopPoint = new PVector(x - body.x, y - body.y);
    PVector leftWingBottomPoint = new PVector(x - body.x, y);
    PVector leftWingTip = new PVector( leftWingTopPoint.x-40, leftWingBottomPoint.y+20);
    
    PVector rightWingTopPoint = new PVector(x + body.x, y - body.y);
    PVector rightWingBottomPoint = new PVector(x + body.x, y);
    PVector rightWingTip = new PVector( rightWingTopPoint.x+40, rightWingBottomPoint.y+20);
   
    sprite = createShape(GROUP);
    
    PShape wings = createShape();
    wings.beginShape();
    
    // left wing
    wings.vertex(leftWingTopPoint.x, leftWingTopPoint.y);
    wings.bezierVertex(leftWingTopPoint.x-5, leftWingTopPoint.y+5, leftWingTip.x-2, leftWingTip.y-5, leftWingTip.x, leftWingTip.y);
    wings.bezierVertex(leftWingTip.x + 2, leftWingTip.y-5,leftWingBottomPoint.x-5, leftWingBottomPoint.y-5, leftWingBottomPoint.x, leftWingBottomPoint.y);
    
    // right wing
    wings.vertex(rightWingTopPoint.x, rightWingTopPoint.y);
    wings.bezierVertex(rightWingTopPoint.x+5, rightWingTopPoint.y+5, rightWingTip.x+2, rightWingTip.y-5, rightWingTip.x, rightWingTip.y);
    wings.bezierVertex(rightWingTip.x - 2, rightWingTip.y-5, rightWingBottomPoint.x+5, rightWingBottomPoint.y-5, rightWingBottomPoint.x, rightWingBottomPoint.y);
    
    wings.endShape(CLOSE);
    
    
    PShape shipBody = createShape();
    shipBody.beginShape();
    
    shipBody.vertex(x-body.x, y-body.y); // top left
    shipBody.vertex(x+body.x, y-body.y); // top right
    shipBody.vertex(x+body.x, y+body.y); // bottom right
    shipBody.vertex(x-body.x, y+body.y); // bottom left
    
    shipBody.endShape(CLOSE);
    
    
    PShape cone = createShape();
    cone.beginShape();
    
    cone.vertex(x-body.x, y-body.y); // top left
    cone.bezierVertex(x-body.x-coneCurve.x, y-body.y-coneCurve.y, coneNose.x-coneCurve.x-4, coneNose.y+coneCurve.y+2, coneNose.x, coneNose.y);
    cone.bezierVertex(coneNose.x+coneCurve.x+4, coneNose.y+coneCurve.y+2, x+body.x+coneCurve.x, y-body.y-coneCurve.y, x+body.x, y-body.y);
    
    cone.endShape(CLOSE);
    
    PShape tail = createShape();
    tail.beginShape();
    
    tail.vertex(x-10, y + body.y); // top left
    tail.vertex(x-10, y + body.y + 5); // bottom left
    tail.vertex(x+10, y + body.y + 5); // bottom right
    tail.vertex(x+10, y + body.y); // top right
    
    
    sprite.addChild(wings);
    sprite.addChild(shipBody);
    sprite.addChild(cone);
    sprite.addChild(tail);
  }
  
  void display() {
    shape(sprite);
  }
}
