class Map {
  int cols, rows;
  int scl = 105; // Size of each grid square
  float[][] terrain;


  Map(int w, int h) {
    cols = w / scl;
    rows = h / scl;
    terrain = new float[cols][rows];
    generate();
  }

  void generate() {
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -250, 850);
        xoff += 0.1;
      }
      yoff += 0.1;
    }
  }

  void drawMap() {
  noStroke(); 

  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      
      float h1 = terrain[x][y];
      float h2 = terrain[x][y+1];

      
      setBiomeColor(h1); 
      vertex(x * scl, y * scl, h1);

      
      setBiomeColor(h2); 
      vertex(x * scl, (y + 1) * scl, h2);
    }
    endShape();
  }
}

// Helper function to keep drawMap() clean
void setBiomeColor(float h) {
  if (h < 135) {
    fill(100, 80, 60);    // DIRT
  } else if (h < 270) {
    fill(60, 150, 60);    // GRASS
  } else if (h < 350) {
    fill(100, 110, 100);  // ROCK
  } else {
    fill(255, 255, 255);  // SNOW
  }
}

  void drawWater() {

    pushMatrix();
    float seaLevel = 110;
    noStroke();
    fill(0, 151, 207, 150);

    beginShape();
    vertex(0, 0, seaLevel);
    vertex(cols * scl, 0, seaLevel);
    vertex(cols * scl, rows * scl, seaLevel);
    vertex(0, rows * scl, seaLevel);
    endShape(CLOSE);
    popMatrix();
  }


  float getGroundHeight(float x, float y) {
    int gridX = int(x / scl);
    int gridY = int(y / scl);

    // Stay within the boundaries of the array to prevent crashes
    if (gridX >= 0 && gridX < cols && gridY >= 0 && gridY < rows) {
      return terrain[gridX][gridY];
    }
    return 0; // Default if off-map
  }
}
