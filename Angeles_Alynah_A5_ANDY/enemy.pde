class Enemy {
  //set float speed to 1
  private final float speed = 1;
  
  //state primitives for enemy coords
  float enemyX;
  float enemyY;
  
  int life;
  //PVectors for directions
  PVector direction;
  PVector last_direction;

  //Arraylist for enemy bullets
  ArrayList<Bullet> bullets_shoot = new ArrayList<>();
  
  //state variables for monster fire rate and time dead for blood effects
  long last_shoot = 0;
  long time_dead = 0;
  
  //Where is monster aiming
  long last_aim = 0;
  
  public Enemy() {
    spawn();
    //state value of last_direction to direction x and y
    last_direction = new PVector(direction.x, direction.y);
  }
  
  private void changeDirection() {
    if(random(0, 100) > 50) //randomize directional movements
      direction = new PVector(0, round(random(-10, 10)));  
    else 
      direction = new PVector(round(random(-10, 10)), 0);
      
    direction.normalize();
  }
  
  void display() {
    
    if(life > 0) { //if enemy life is more than 0
      imageMode(CENTER); //display enemy sprite
      image(enemySprites[0], this.enemyX, this.enemyY);
      imageMode(CORNER);
    }
    else {
      
      if(time_dead == 0) time_dead = millis(); //if enemy dead
      
      if(millis() - time_dead < 2000) { //display blood splotches on ground
        fill(255, 0, 0, map(millis() - time_dead, 0, 2000, 255, 0));
        //coords for blood on floor
        ellipse(this.enemyX - 5, this.enemyY, 3, 3); 
        ellipse(this.enemyX + 5, this.enemyY, 4, 4);
        ellipse(this.enemyX, this.enemyY, 2, 2);
        ellipse(this.enemyX, this.enemyY + 5, 3, 3);
      }
    }
    
    //Display bullet shots
    for(Bullet b : bullets_shoot) {
      b.display();  
    }
  }
  
  void move() {
    if(life > 0) { //set enemy movement, 
    float nextX = this.enemyX + this.direction.x * this.speed;
    float nextY = this.enemyY + this.direction.y * this.speed;

    
    if(!collision(nextX, nextY)) { //if no collision, proceed to next coordinate
      this.enemyX = nextX;
      this.enemyY = nextY;
    }
    else { //if collision, change the direction
      // hit a building
      changeDirection();
    }
    //Proximity detection between Andy and enemies
    float dist = sqrt(pow(a.andyX - this.enemyX, 2) + pow(a.andyY - this.enemyY, 2));
    
    //if distance is less than 250
    if(dist < 250) {
     
      
      if(abs(a.andyX - this.enemyX) < 10) { //if andyX - enemyX is less than 10
        if(a.andyY > this.enemyY) { //but andyY is greater than enemyY
          direction = new PVector(0, 1); //Enemy moves down to attack Andy
        }
        else { //if andyY is less than enemyY, move the opposite direction (move up towards her)
          direction = new PVector(0, -1);  
        }
       
        if(millis() - this.last_aim > 1000 && dist < 100) { //Sets shooting speed and to start shooting when distance to Andy is less than 100pxls
          shoot();    
        }
      }
      
      else if(abs(a.andyY - this.enemyY) < 10) { //if andyY - enemyY is less than 10pxls (in same road block)
        if(a.andyX > this.enemyX) { //if Andy's X is greater than enemyX, move enemy to the right towards her
          direction = new PVector(1, 0);  
        }
        else { //if vice versa, move the enemy towards the left, where Andy is situated
          direction = new PVector(-1, 0);  
        }
        
        if(millis() - this.last_aim > 1000 && dist < 100) { //time the shots if the enemy is less than 100pxls from Andy
          shoot();    
        }
      }
      }
      //Tracks the movement of the monster and the change of direction
      if(last_direction.x != direction.x || last_direction.y != direction.y) {
        this.last_aim = millis();
        println("change " + last_aim);
        last_direction = new PVector(direction.x, direction.y);

      } //randomize the enemies movements
      if(random(0, 100) > 95) {
        changeDirection();  
      }
    }
    //Display bullets
    for(Bullet b : bullets_shoot) {
      b.move(); 
    }
  }
  
   void shoot() { //shoot mechanics depending on the direction of the enemy
     if(millis() - last_shoot > 2000) {
        last_shoot = millis();
        PVector aim = new PVector(0, 0);
        
        if(direction.y < 0) aim = new PVector(0, -1); //if Y-coord is declining, shoot the bullets up
        if(direction.x < 0) aim = new PVector(-1, 0); //if X coord is declining to 0, shoot bullets left
        if(direction.y > 0) aim = new PVector(0, 1); //if Y coord is getting higher, shoot bullets down
        if(direction.x > 0) aim = new PVector(1, 0); //if X coord is getting higher, shoot bullets to the right
    
        this.bullets_shoot.add(new Bullet(this.enemyX, this.enemyY, aim, false));
     }
  }
  
  boolean collision(float x, float y){
    
    //Collisions with building
    for(Building b : buildings) {
      if(x > b.buildingX && x < b.buildingX + b.buildingWidth
      && y > b.buildingY && y < b.buildingY + b.buildingHeight) {
        return true;  
      }
    }
    
    if(x < 0 || x > width || y < 0 || y > height) {
      return true;  
    }
    
    return false;
  }
  
  void spawn() {
    this.life = 3; //set life to 3
    this.changeDirection();
    //state spawn X, Y coord
    float spawnX, spawnY;
    
    do { //spawn enemies in at a random X and Y coordinate 
      spawnX = random(0, width);
      spawnY = random(0, height);
    } while(collision(spawnX, spawnY));
    
    this.enemyX = spawnX;
    this.enemyY = spawnY;
  }
}
