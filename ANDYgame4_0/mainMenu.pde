class mainMenu {
  void display() {
  //Set background colour
  noStroke();
  rectMode(CORNER);
  
  //Write ANDY on top left
  fill(235);
  textSize(60);
  text("ANDY", 32, 120);
  
  //Start button box
  fill(102, 5, 34);
  rect(45, 278, 75, 30);
  
  //Write START so player can begin game
  textSize(24);
  fill(255);
  text("START", 50, 300);
  
  //Draw platform on background
  fill(67, 3, 22);
  rect(0, 360, 400, 40);
  
  //Draw ANDY:
  
  //Draw Andy's neck
  stroke(102, 5, 34);
  fill(102, 5, 34);
  rect(285, 130, 20, 30);
  
  //Draw Andy's hair
  triangle(280, 45, 230, 80, 310, 80); //left hair split
  triangle(290, 45, 350, 55, 260, 100); //right hair split
  triangle(230, 80, 250, 110, 240, 80); //left hair on side of head
  triangle(350, 55, 340, 60, 340, 100); //right hair on side of head
  triangle(230, 80, 210, 70, 195, 110); //Left pigtail
  triangle(350, 55, 370, 40, 390, 80); //Right pigtail
  
  //Andy's head
  stroke(192, 12, 48);
  fill(192, 12, 48);
  triangle(240, 80, 290, 60, 250, 120);
  triangle(290, 60, 340, 60, 340, 105);
  triangle(290, 60, 340, 105, 250, 120);
  triangle(340, 105, 250, 120, 290, 140);
  
  //Andy's pelvis
  stroke(102, 5, 34);
  fill(102, 5, 34);
  triangle(265, 230, 230, 300, 320, 300);
  
  //Andy's torso
  stroke(192, 12, 48);
  fill(192, 12, 48);
  triangle(285, 160, 305, 160, 265, 270); //torso centre
  triangle(285, 160, 245, 165, 265, 270); //torso left side
  triangle(305, 160, 345, 180, 265, 270); //torso right side
  
  //Cover tip of Andy's torso
  stroke(102, 5, 34);
  fill(102, 5, 34);
  triangle(258, 243, 265, 285, 283, 252);
  
  //Andy's legs
  //Left leg
  triangle(230, 300, 245, 400, 270, 400);
  triangle(270, 300, 277, 300, 265, 350);
  triangle(230, 300, 270, 300, 265, 400);
  
  //Right leg
  triangle(275, 300, 320, 300, 320, 400);
  triangle(290, 330, 295, 400, 320, 400);
  triangle(275, 300, 290, 300, 290, 340);
  
  //Left arm
  //Upper arm
  triangle(345, 180, 325, 200, 340, 250);
  //Forearm
  triangle(340, 250, 347, 267, 340, 330);
  triangle(340, 250, 330, 270, 340, 330);
  
  //Right arm
  //Upper arm
  triangle(245, 165, 252, 210, 230, 240);
  //Forearm
  triangle(230, 240, 213, 260, 230, 260);
  triangle(213, 260, 230, 260, 210, 320);
  }
}
