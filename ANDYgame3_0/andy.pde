class andy {
  float andyX, andyY;
  float andyWalk = 2;
  float andyDash = 5;
  int currentFrame = 1;
  boolean andySpawnPoint = false;
  boolean andyDashing = false;
  
  boolean dashUp, dashDown, dashLeft, dashRight = false;
  
  void display(PImage[] andySprites) {
    if(andySpawnPoint == false) {
      andyX = width/2;
      andyY = height/2;
      andySpawnPoint = true;
    }
    image(andySprites[currentFrame], andyX, andyY);
  }
  
  void andyMove(boolean Up, boolean Down, boolean Left, Boolean Right, boolean Dash) {
    println("Dash: " + Dash);
    println("Up: " + Up + ", Down: " + Down + ", Left: " + Left + ", Right: " + Right);
    
    if (Dash == true) {
      andyDashing = true;
    }
    
    if (andyDashing == true) {
      if (Up) {
        andyY = andyY - andyDash;
        dashUp = true;
        dashDown = true;
        dashLeft = true;
        dashRight = true;
      }
      if (Down) {
        andyY = andyY + andyDash;
        dashDown = true;
        dashUp = true;
        dashLeft = true;
        dashRight = true;
      }
      if (Left) {
        andyX = andyX - andyDash;
        dashLeft = true;
        dashRight = true;
        dashUp = true;
        dashDown = true;
      }
      if (Right) {
        andyX = andyX + andyDash;
        dashRight = true;
        dashLeft = true;
        dashUp = true;
        dashDown = true;
      }
    } else {
      andyDashing = false;
    }
    
    if(andyDashing == false) {
      if (Up) {
        andyY -= andyWalk;
      }
      if (Down) {
        andyY += andyWalk;
      }
      if (Left) {
        andyX -= andyWalk;
      }
      if (Right) {
        andyX += andyWalk;
      }
    }
  }
}
