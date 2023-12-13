class andy {
  float andyX, andyY;
  int currentFrame = 1;
  
  void display(PImage[] andySprites) {
    image(andySprites[currentFrame], andyX, andyY);
    andyX = width/2;
    andyY = height/2;
  }
  
  void andyMove(boolean Up, boolean Down, boolean Left, boolean Right, boolean Dash) {
    if ((Up == true) && (Dash != true)) {
      andyY = andyY + 2;
    }
    if ((Down == true) && (Dash != true)) {
      andyY = andyY + 2;
    }
    if ((Left == true) && (Dash == true)) {
      andyX = andyX + 4;
    }
    if ((Right == true) && (Dash == true)) {
      andyX = andyX + 4;
    }
  }
}
