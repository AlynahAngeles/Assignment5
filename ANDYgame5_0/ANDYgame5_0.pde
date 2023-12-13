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

void setup() {
  size(400,400);
  ellipseMode(CENTER);
  frameRate(30);
  println("You ready to kick some ass?!");
  
  //stating classes
  //n = new gameMap();
  a = new andy();
  e = new enemy();
  //b = new bullet();
  m = new mainMenu();
  g = new mainGame();
  
  andyFrames = 4;
  enemyFrames = 1;
  
  andySprites = new PImage [andyFrames];
  enemySprites = new PImage [enemyFrames];
  
  for(int i = 0; i < andySprites.length; i++) {
    andySprites[i] = loadImage("Sprites/ANDY0"+i+".png");
  }
}

void draw() {
  background(156, 14, 42);
  
   if(gameStarted) {
     g.display();
     a.display(andySprites);
     a.andyMove(Up, Down, Left, Right);
     Up = false;
     Down = false;
     Left = false;
     Right = false;
    } else {
     menuOn = true;
     m.display();
    }
}

void mousePressed() {
  if(menuOn == true) {
    if((mouseX > 45) && (mouseX < 120) && (mouseY > 278) && (mouseY < 308)) {
      g = new mainGame();
      gameStarted = true;
      menuOn = false;
    }
  }
}

void keyPressed() {
  if(gameStarted) {
    if (key ==  'w') {
      Up  = true;
    }
    if (key == 'a') {
      Left = true;
    }
    if (key == 's') {
      Down = true;
    }
    if (key == 'd') {
      Right = true;
    }
  }
}

void keyReleased() {
  if (gameStarted) {
    if (key == 'w') {
      Up = false;
    }
    if (key == 'a') {
      Left = false;
    }
    if (key == 's') {
      Down = false;
    }
    if (key == 'd') {
      Right = false;
    }
  }
}
