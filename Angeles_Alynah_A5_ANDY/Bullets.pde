class Bullet {
  private final float speed = 7; //set bullet speed to 7 frames per second
  
  //float for bullet coordinates
  float bulletX;
  float bulletY;
  
  //PVector for bullet direction
  PVector direction;
  //boolean statement for if bullet is active or not
  boolean active;
  //boolean statement for if andy is shooting
  boolean isPlayerShoot;
  
  //initialize value for bulletX and Y
  public Bullet(float x, float y, PVector d, boolean player) {
    this.bulletX = x;
    this.bulletY = y;
    
    //Mark if the bullet is active and the direction
    this.direction = d;
    this.active = true;
    this.isPlayerShoot = player;
  }
  //display bullet
  void display() {
    if(this.active) {
      if(isPlayerShoot) fill(255, 0, 0); //set bullet colour to red
      else fill(0, 255, 0); //if monster is shooting, make bullet green
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
    
    //Collision with building
    for(Building b : buildings) {
      if(andyX > b.buildingX && andyX < b.buildingX + b.buildingWidth
      && andyY > b.buildingY && andyY < b.buildingY + b.buildingHeight) {
        return true;  
      }
    }
    
    //Collision with enemy
    for(Enemy e : enemy_list) { //if Andy shoots the enemy, kill enemy and spawn another
      if(e.life > 0 && sqrt(pow(e.enemyX - andyX, 2) + pow(e.enemyY - andyY, 2)) < 15) {
        if(isPlayerShoot) {
          e.life--;
          
          if(e.life <= 0) { //add 1 to te score and spawn a new enemy
            score++;
            enemy_list.add(new Enemy()); 
          }
          return true;    
        }       
      }
    }
    
    if(sqrt(pow(a.andyX - andyX, 2) + pow(a.andyY - andyY, 2)) < 15) {
        if(!isPlayerShoot) {
          a.life--;
        
          return true;    
        }
    }
    
    
    
    if(andyX < 0 || andyX > width || andyY < 0 || andyY > height) {
      
      return true;
    }
    
    return false;
  }
}
