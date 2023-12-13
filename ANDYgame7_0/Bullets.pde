class Bullet {
  private final float speed = 10; //set bullet speed to 10 frames per second
  //float for bullet coordinates
  float bulletX; 
  float bulletY;
  //PVector for bullet direction
  PVector direction;
  //boolean statement for if bullet is active or not
  boolean active;
  
  //initialize value for bulletX and Y
  public Bullet(float x, float y, PVector d) {
    this.bulletX = x;
    this.bulletY = y;
    
    //Mark if the bullet is active and the direction
    this.direction = d;
    this.active = true;
  }
  //display bullet
  void display() {
    if(this.active) {
      fill(255, 0, 0); //set bullet colour to red
      ellipse(this.bulletX, this.bulletY, 5, 5); //display bullet to ellipse 5x5 pxls
    }
  }
  
  void move() {
    //if bullet is active, set next position
    if(active) {
      float nextX = this.bulletX + this.direction.x * this.speed;
      float nextY = this.bulletY + this.direction.y * this.speed;
      //if no collision with building, bullet is still true and keep going forward
      if(!collision(nextX, nextY)) {
        this.bulletX = nextX;
        this.bulletY = nextY;
      }
      //if there is collision, stop the bullet animation
      else {
        this.active = false;  
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
    
    return false;
  }
  
  
}
