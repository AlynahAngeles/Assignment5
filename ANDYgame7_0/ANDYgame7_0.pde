//December 4th, 2023
//Programming for Game Designers (GAME12805)
//Prof. Kit Barry
//"ANDY" 
//By: Alynah Angeles

//Set classes to a variable
mainMenu m;
mainGame g;
//gameMap n;
andy a;
enemy e;
//bullet b;

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
  size(400,400);
  ellipseMode(CENTER); //set ellipse mode to CENTER
  frameRate(30); //set framerate to 30 frames/sec
  println("You ready to kick some ass?!"); //print line on main screen
  
  //stating classes
  //n = new gameMap();
  a = new andy();
  e = new enemy();
  //b = new bullet();
  m = new mainMenu();
  g = new mainGame();
  
  andyFrames = 4; //set andy's frame count to 4 frames to populate array
  enemyFrames = 1; //set enemy frames to 1 frame to populate array
  
  andySprites = new PImage [andyFrames]; //assign the frames to the sprite
  enemySprites = new PImage [enemyFrames];
  
  for(int i = 0; i < andySprites.length; i++) { //load the image based on the png file name
    andySprites[i] = loadImage("Sprites/ANDY0"+i+".png");
  }
}

void draw() {
  background(156, 14, 42);
  
   if(gameStarted) { //if game started, display the mainGame
     g.display();
     
     //display andy's sprites
     a.display(andySprites);
     
     //display andy's controls
     a.andyMove(Up, Down, Left, Right);
     
    } else { //if game is false, display the menu screen
     menuOn = true;
     m.display();
    }
}

void mousePressed() { //Collision for start button on main menu
  if(menuOn == true) {
    if((mouseX > 45) && (mouseX < 120) && (mouseY > 278) && (mouseY < 308)) {
      g = new mainGame();
      gameStarted = true;
      menuOn = false;
    }
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
    
    if(key == ' ') { //press space for shoot
      a.shoot();  
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
