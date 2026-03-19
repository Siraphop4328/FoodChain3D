void drawMap() {
for (int x = 0; x < 30; x++) {
    for (int y = 0; y < 30; y++) {
      fill(65, 120, 83);
      noStroke();                           /// GREEN FLOOR AT Z-0
      beginShape();
      vertex(x * 100, y * 100, 0);
      vertex((x+1) * 100, y * 100, 0);
      vertex((x+1) * 100, (y+1) * 100, 0);
      vertex(x * 100, (y+1) * 100, 0);
      endShape(CLOSE);
    }
  }        

  for (int x = 0; x < 30; x++) {
    for (int y = 0; y < 30; y++) {
      fill(40, 90, 212, 100);
      noStroke();
      beginShape();                           // BLUE FLOOR AT Z-100 ( Sea water level )
      vertex(x * 100, y * 100, 100);
      vertex((x+1) * 100, y * 100, 100);
      vertex((x+1) * 100, (y+1) * 100, 100);
      vertex(x * 100, (y+1) * 100, 100);
      endShape(CLOSE);
    }
  }  
}

