class andy {
  float andyX, andyY;
  float andyWalk = 5;
  int andyFront = 0;
  int andyBack = 1;
  int andyLeft = 2;
  int andyRight = 3;
  boolean andySpawnPoint = false;
  int andyPos = andyFront;
  int frameCounter = 0;
  
  void display(PImage[] andySprites) {
    println("X: " + andyX + "Y: " + andyY);
    if(andySpawnPoint == false) {
      andyX = 187;
      andyY = 186;
      andySpawnPoint = true;
    }
    image(andySprites[andyPos], andyX, andyY);
  }
  
  void andyMove(boolean Up, boolean Down, boolean Left, Boolean Right) {
    frameCounter++;
    
    andyWalk = 5;
    
    if (frameCounter % 2 == 0) {
      
      if (Up == true) { //If Up is true ('w' is pressed) walk upward
        if (!collision(andyX, andyY - andyWalk)) {
          andyY = max(andyY - andyWalk, 0);
          andyPos = andyBack;
        }
      } 
      if(Left == true) { //If Left is true ('a' is pressed) walk to the left
        if(!collision(andyX - andyWalk, andyY + 20)) {
          andyX = max(andyX - andyWalk, 0);
          andyPos = andyLeft;
        }
      }
      if(Down == true) { //If Down is true ('s' is pressed) walk downward
        if(!collision(andyX, andyY + andyWalk + 20)) {
          andyY = min(height - 27, andyY + andyWalk);
          andyPos = andyFront;
        }
      }
      if(Right == true) { //If Right is true ('w' is pressed) walk to the right
        if(!collision(andyX + andyWalk, andyY)) {
          andyX = min(width - 16, andyX + andyWalk);
          andyPos = andyRight;
        }
      }
      
      frameCounter = 0;
    }
  }
  
  boolean collision(float andyX, float andyY) {
    boolean collisionDetected = false;
    
      if ((andyX >= 0 && andyX <= 80) && (andyY >= 0 && andyY <= 80)) {
      collisionDetected = true;
    }
      if ((andyX >= 0 && andyX <= 80) && (andyY >= 100 && andyY <= 140)) {
      collisionDetected = true;
    } 
      if ((andyX >= 0 && andyX <= 80) && (andyY >= 160 && andyY <= 240)) {
      collisionDetected = true;
    } 
      if ((andyX >= 0 && andyX <= 80) && (andyY >= 260 && andyY <= 320)) {
      collisionDetected = true;
    } 
      if ((andyX >= 0 && andyX <= 80) && (andyY >= 340 && andyY <= 380)) {
      collisionDetected = true;
    }
    
    return collisionDetected;
    }
}
    
