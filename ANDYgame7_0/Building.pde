class Building {
  //state floats for building's x,y coordinates
  float buildingX;
  float buildingY;
  //floats for building's dimensions
  float buildingWidth;
  float buildingHeight;
  //Make building coordinates and dimension accessible for other classes
  public Building(float x, float y, float w, float h) {
    this.buildingX = x;
    this.buildingY = y;
    this.buildingWidth = w;
    this.buildingHeight = h;
  }
  
  void display() {
    fill(27, 218, 218); //set building colour to cyan
    rectMode(CORNER); //spawn rectangles from corner
    noStroke(); //set graphics to no outline
    //display the buildings
    rect(this.buildingX, this.buildingY, this.buildingWidth, this.buildingHeight);
    
  }
  
}
