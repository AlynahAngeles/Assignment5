 class mainGame {
  void display() {
    //set background to black
    background(0);
    
    //display buildings
    for(Building b : buildings) b.display();
    //display enemies
    for(Enemy e : enemy_list) e.display();
    //Andy's life count and score
    fill(0);
    text("Life: " + a.life, 10, 20);
    text("Score: " + score, 200, 20);

    
  }
}
