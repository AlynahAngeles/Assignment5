class andy {
  //state primitive variables
  float andyX, andyY;
  float andyWalk = 5;
  int andyFront = 0;
  int andyBack = 1;
  int andyLeft = 2;
  int andyRight = 3;
  int andyPos = andyFront;
  int frameCounter = 0;
  int life = 3;
  //state boolean statement for Andy's spawn point
  boolean andySpawnPoint = false;
  
  // bullets shot by andy
  ArrayList<Bullet> bullets_shoot = new ArrayList<>();

  
  void display(PImage[] andySprites) {
    //println("X: " + andyX + "Y: " + andyY);
    if(andySpawnPoint == false) { //setting Andy's spawn x,y coords
      andyX = 187;
      andyY = 186;
      andySpawnPoint = true;
    }
    imageMode(CENTER); //setting image mode to CENTER
    image(andySprites[andyPos], andyX, andyY); //image depends on Andy's positioning
    imageMode(CORNER);
    
    //display bullets shooting
    for(Bullet b : bullets_shoot) {
      b.display();  
    }
  }
  //shoot mechanic for Andy
  void shoot() {
    PVector aim = new PVector(0, 0);
    
    if(andyPos == andyBack) aim = new PVector(0, -1); //if andy's position is back, move bullet up
    if(andyPos == andyLeft) aim = new PVector(-1, 0); //if andy's position is left, move bullet to the left
    if(andyPos == andyFront) aim = new PVector(0, 1); //if andy's position is front, move bullet down
    if(andyPos == andyRight) aim = new PVector(1, 0); //if andy's position is right, move bullet to the right

    //if the bullet shoots, animate new bullet depending on where andy is facing
    this.bullets_shoot.add(new Bullet(this.andyX, this.andyY, aim, true));
  }
  //Andy's movements
  void andyMove(boolean Up, boolean Down, boolean Left, Boolean Right) {
    frameCounter++;
    
    andyWalk = 5; //set Andy's speed to 5pixels per frame
    
    if (frameCounter % 2 == 0) { //change frame every two frames
      
      if (Up && !collision(andyX, andyY - andyWalk)) { //if facing up and no collision
          andyY = max(andyY - andyWalk, 0); //move Andy's y-coord up (subtract walk speed from Y coord)
          andyPos = andyBack; //set Andy's frame to her backside
        }
      if(Left && !collision(andyX - andyWalk, andyY)) { //if facing left and no collision
          andyX = max(andyX - andyWalk, 0); //move Andy's x-coord left (subtract walk speed from x coord)
          andyPos = andyLeft; //set Andy's frame to her left side
        }
      if(Down && !collision(andyX, andyY + andyWalk)) { //if facing front and no collision
          andyY = min(height - 27, andyY + andyWalk); //move Andy's y-coord down (add walk speed to Y-coord)
          andyPos = andyFront; //set Andy's frame to front side
        }
      if(Right && !collision(andyX + andyWalk, andyY)) { //if facing right and no collision
          andyX = min(width - 5, andyX + andyWalk); //move Andy's x-coord right (add walk speen to x-coord)
          andyPos = andyRight; //set Andy's frame to right side
        }
      
        frameCounter = 0; //reset frame counter to 0
        
        // Move bullets
        for(Bullet b : bullets_shoot) {
          b.move(); 
        }
     }
  }
  
  boolean collision(float andyX, float andyY) {
    
    // Collisions with building
    for(Building b : buildings) {
      if(andyX > b.buildingX && andyX < b.buildingX + b.buildingWidth
      && andyY > b.buildingY && andyY < b.buildingY + b.buildingHeight) {
        return true;  
      }
    }
    
    if(andyX < 0 || andyX > width || andyY < 0 || andyY > height) {
      return true;  
    }
    
    return false;
  }
}
