class mainGame {
  void display() {
    background(0);
    rectMode(CORNER);
    noStroke();
    
    //draw constricting pathway or the "buildings"
    fill(27, 218, 218);
    //Left buildings
    rect(0,0,80,80);
    rect(0, 100, 80, 40);
    rect(0, 160, 80, 80);
    rect(0, 260, 80, 60);
    rect(0, 340, 80, 60);
    
    //Middle buildings
    rect(100, 0, 200, 80);
    rect(160, 80, 80, 60);
    rect(100, 100, 40, 40);
    rect(260, 100, 40, 40);
    rect(100, 160, 20, 80);
    rect(280, 160, 20, 80);
    rect(140, 160, 120, 20);
    rect(140, 180, 20, 60);
    rect(240, 180, 20, 60);
    rect(160, 220, 20, 20);
    rect(220, 220, 20, 20);
    rect(100, 260, 40, 60);
    rect(260, 260, 40, 60);
    rect(100, 340, 40, 60);
    rect(260, 340, 40, 60);
    rect(160, 340, 80, 60);
    rect(160, 260, 20, 60);
    rect(220, 260, 20, 60);
    rect(180, 300, 40, 20);
    
    //Right buildings
    rect(320, 0, 80, 80);
    rect(320, 100, 80, 40);
    rect(320, 160, 80, 80);
    rect(320, 260, 80, 60);
    rect(320, 340, 80, 60);

    
  }
}
