//December 4th, 2023
//Programming for Game Designers (GAME12805)
//Prof. Kit Barry
//"ANDY" 
//By: Alynah Angeles
//Help Andy protect her Cyberpunk City from these slimy monsters!
//Controls: WASD, press mouse to shoot bullets!

//Set classes to a variable
mainMenu m;
mainGame g;
andy a;

//Set score to 0 by default
int score = 0;

//Make an arraylist for the enemy
ArrayList<Enemy> enemy_list = new ArrayList<>();

//Upload character sprites
PImage andySprites [];
PImage enemySprites [];

//State booleans
boolean gameStarted = false;
boolean menuOn = true;
boolean Up = false;
boolean Down = false;
boolean Left = false;
boolean Right = false;

//states variables
int andyFrames;
int enemyFrames;

Building buildings[] = new Building[] {
  //Coordinates for left buildings
    new Building(0,0,80,80),
    new Building(0, 100, 80, 40),
    new Building(0, 160, 80, 80),
    new Building(0, 260, 80, 60),
    new Building(0, 340, 80, 60),
    
    //Middle buildings
    new Building(100, 0, 200, 80),
    new Building(160, 80, 80, 60),
    new Building(100, 100, 40, 40),
    new Building(260, 100, 40, 40),
    new Building(100, 160, 20, 80),
    new Building(280, 160, 20, 80),
    new Building(140, 160, 120, 20),
    new Building(140, 180, 20, 60),
    new Building(240, 180, 20, 60),
    new Building(160, 220, 20, 20),
    new Building(220, 220, 20, 20),
    new Building(100, 260, 40, 60),
    new Building(260, 260, 40, 60),
    new Building(100, 340, 40, 60),
    new Building(260, 340, 40, 60),
    new Building(160, 340, 80, 60),
    new Building(160, 260, 20, 60),
    new Building(220, 260, 20, 60),
    new Building(180, 300, 40, 20),
    
    //Right buildings
    new Building(320, 0, 80, 80),
    new Building(320, 100, 80, 40),
    new Building(320, 160, 80, 80),
    new Building(320, 260, 80, 60),
    new Building(320, 340, 80, 60)
};

void setup() {
  size(400,400); //Set canvas size to 400
  ellipseMode(CENTER); //set ellipse mode to CENTER
  frameRate(30); //set framerate to 30 frames/sec
  println("You ready to kick some ass?!"); //print line on main screen
  
  //stating classes
  //n = new gameMap();
  a = new andy();
  
  //b = new bullet();
  m = new mainMenu();
  g = new mainGame();
  
  //Make it so an enemy spawns in if one of them dies, limiting enemies to 2 at a time
  for(int i = 0; i < 2; i++) {
    enemy_list.add(new Enemy());
  }

  //setting Andy's sprite to 4 images to populate the array
  andyFrames = 4;
  //set enemy frames to 1 frame to populate array
  enemyFrames = 1;
  
  //command so the PImage can load in every frame
  andySprites = new PImage [andyFrames];
  enemySprites = new PImage [enemyFrames];
  
  for(int i = 0; i < andySprites.length; i++) { //load the image based on png name starting from 00
    andySprites[i] = loadImage("Sprites/ANDY0"+i+".png");
  }
  
  for(int i = 0; i < enemySprites.length; i++) { //load image according to png name starting from 00
    enemySprites[i] = loadImage("Sprites/ENEMY0"+(i+1)+".png");
  }
}

void draw() {
   if(gameStarted && a.life > 0 && score < 30) { //if the game started and Andy's life is more than 0, score is less than 30
     g.display(); //load the main game
     a.display(andySprites); //load Andy
     a.andyMove(Up, Down, Left, Right); //load Andy's mechanics
     
     for(Enemy e : enemy_list) e.move(); //load the enemy and its movements
     
    } else if(a.life == 0) { //if Andy dies, display the game over screen
      fill(0);
      background(0);
      textAlign(CENTER);
      fill(255);
      text("GAME OVER", width/2, height/2);
      text("PRESS SPACE TO RESTART", width/2, height/2 + 150);  

    } else if(score >= 30) { //if score is less than or equal to 30, display victory screen
      fill(0);
      background(0);
      fill(255);
      textAlign(CENTER);
      text("YOU WIN", width/2, height/2);  
      text("PRESS SPACE TO RESTART", width/2, height/2 + 150);  

    }
    else { //if neither, display main menu
     
     menuOn = true;
     m.display();
    }
    textAlign(LEFT); //Make text align from the left

}

void restart() { //if restarting the game
  
  a = new andy(); //spawn new Andy
  m = new mainMenu(); //spawn new menu
  g = new mainGame(); //load new game
  
  enemy_list = new ArrayList<>(); //spawn monsters
  score = 0; //reset score to 0
  
  for(int i = 0; i < 2; i++) { //spawn in monsters if there's less than 2
    enemy_list.add(new Enemy());
  }  
}

void mousePressed() { //Mouse press detection for start button on main menu
  if(menuOn == true) {
    if((mouseX > 45) && (mouseX < 120) && (mouseY > 278) && (mouseY < 308)) {
      g = new mainGame(); //load game if pressed
      gameStarted = true; //boolean turned to true
      menuOn = false; //menu turned to false
    }
  }
  else {
    a.shoot(); //if not main menu, mousePressed is Andy's bullets shooting
  }
}

void keyPressed() { //movement controls for andy
  if(gameStarted) {
    if (key ==  'w') { //press w for up
      Up  = true;
    }
    if (key == 'a') { //press a for left
      Left = true;
    }
    if (key == 's') { //press s for down
      Down = true;
    }
    if (key == 'd') { //press d for right
      Right = true;
    }
    if(key == ' ') { //press space for restart
      restart();  
    }
   
  }
}



void keyReleased() {
  if (gameStarted) {
    if (key == 'w') { //stop moving up when w key is released
      Up = false;
    }
    if (key == 'a') { //stop moving up when a key is released
      Left = false;
    }
    if (key == 's') { //stop moving up when s key is released
      Down = false;
    }
    if (key == 'd') { //stop moving up when d key is released
      Right = false;
    }
  }
}
