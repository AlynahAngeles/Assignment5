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
      
      if (Up && !collision(andyX, andyY - andyWalk)) {
          andyY = max(andyY - andyWalk, 0);
          andyPos = andyBack;
        }
      if(Left && !collision(andyX - andyWalk, andyY + 20)) {
          andyX = max(andyX - andyWalk, 0);
          andyPos = andyLeft;
        }
      if(Down && !collision(andyX, andyY + andyWalk + 20)) {
          andyY = min(height - 27, andyY + andyWalk);
          andyPos = andyFront;
        }
      if(Right && !collision(andyX + andyWalk, andyY)) {
          andyX = min(width - 5, andyX + andyWalk);
          andyPos = andyRight;
        }
      
        frameCounter = 0;
     }
  }
  
  boolean collision(float andyX, float andyY) {
    boolean collisionDetected = false;

    float andyFeetW = 18;
    float andyFeetH = 26;
    
    //Detection for left buildings
    if ((andyX >= 0 && andyX <= 70) && (andyY >= 0 && andyY <= 80)) {
        collisionDetected = true;
    }
    if ((andyX >= 0 && andyX <= 70) && (andyY >= 100 && andyY <= 140)) {
        collisionDetected = true;
    }
    if ((andyX >= 0 && andyX <= 70) && (andyY >= 160 && andyY <= 240)) {
        collisionDetected = true;
    }
    if ((andyX >= 0 && andyX <= 70) && (andyY >= 260 && andyY <= 320)) {
        collisionDetected = true;
    }
    if ((andyX >= 0 && andyX <= 70) && (andyY >= 340 && andyY <= 380)) {
        collisionDetected = true;
    }
    if ((andyX >= 0 && andyX <= 80) && (andyY >= 0 && andyY <= 80)) {
        collisionDetected = true;
    }
    //Detection for right buildings
    if ((andyX >= 320 && andyX <= 400) && (andyY >= 0 && andyY <= 80)) {
        collisionDetected = true;
    }
    if ((andyX >= 320 && andyX <= 400) && (andyY >= 100 && andyY <= 140)) {
        collisionDetected = true;
    }
    if ((andyX >= 320 && andyX <= 400) && (andyY >= 160 && andyY <= 240)) {
        collisionDetected = true;
    }
    if ((andyX >= 320 && andyX <= 400) && (andyY >= 260 && andyY <= 320)) {
        collisionDetected = true;
    }
    if ((andyX >= 320 && andyX <= 400) && (andyY >= 340 && andyY <= 400)) {
        collisionDetected = true;
    }

    if (collisionDetected) {
        float halfandyFeetW = andyFeetW / 2;
        float halfandyFeetH = andyFeetH / 2;

        float andyBottom = andyY + halfandyFeetH;
        float andyTop = andyY - halfandyFeetH;
        float andyRight = andyX + halfandyFeetW;
        float andyLeft = andyX - halfandyFeetW;

        if ((andyLeft >= 0 && andyLeft <= 80) && (andyBottom >= 0 && andyTop <= 80)) {
            collisionDetected = true;
        }
        if ((andyLeft >= 0 && andyLeft <= 80) && (andyBottom >= 100 && andyTop <= 140)) {
            collisionDetected = true;
        }
        if ((andyLeft >= 0 && andyLeft <= 80) && (andyBottom >= 160 && andyTop <= 240)) {
            collisionDetected = true;
        }
        if ((andyLeft >= 0 && andyLeft <= 80) && (andyBottom >= 260 && andyTop <= 320)) {
            collisionDetected = true;
        }
        if ((andyLeft >= 0 && andyLeft <= 80) && (andyBottom >= 340 && andyTop <= 380)) {
            collisionDetected = true;
        }

        // Detection for right buildings
        if ((andyRight >= 320 && andyRight <= 400) && (andyBottom >= 0 && andyTop <= 80)) {
            collisionDetected = true;
        }
        if ((andyRight >= 320 && andyRight <= 400) && (andyBottom >= 100 && andyTop <= 140)) {
            collisionDetected = true;
        }
        if ((andyRight >= 320 && andyRight <= 400) && (andyBottom >= 160 && andyTop <= 240)) {
            collisionDetected = true;
        }
        if ((andyRight >= 320 && andyRight <= 400) && (andyBottom >= 260 && andyTop <= 320)) {
            collisionDetected = true;
        }
        if ((andyRight >= 320 && andyRight <= 400) && (andyBottom >= 340 && andyTop <= 400)) {
            collisionDetected = true;
        }
    }
    
       return collisionDetected;
  }
}
