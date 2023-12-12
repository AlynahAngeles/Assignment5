class mainMenu {
  void display() {
  //Set background colour
  noStroke();
  rectMode(CORNER);
  
  //Write ANDY on top left
  fill(235);
  textSize(60);
  text("ANDY", 47, 120);
  textSize(18);
  
  //Write Cyberpunk Warrior as a subtext
  text("Cyberpunk Warrior", 45, 139);
  
  //Draw platform on background
  fill(102, 5, 34);
  rect(0, 360, 400, 40);
  
  //Draw Andy
  }
}
