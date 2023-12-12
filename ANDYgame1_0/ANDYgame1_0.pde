//December 4th, 2023
//Programming for Game Designers (GAME12805)
//Prof. Kit Barry
//"ANDY" 
//By: Alynah Angeles

//Set classes to a variable
mainMenu m;
//gameMap n;
//andy a;
//enemy e;
//bullet b;

//State booleans
boolean gameStarted = false;

void setup() {
  size(400,400);
  ellipseMode(CENTER);
}

void draw() {
  background(156, 14, 42);
  //stating classes
  m = new mainMenu();
  //n = new gameMap();
  //a = andy();
  //e = new enemy();
  //b = new bullet();
  
  //Draw these functions from these classes
  m.display();
}
