void drawUI() {
  drawCrosshair(false);
  drawCoord();
}

void drawCrosshair(boolean RedOrNot) {
  hint(DISABLE_DEPTH_TEST);
  if (RedOrNot) {
    stroke(255, 0, 0);
  } else {
    stroke(255);
  }

  strokeWeight(4);
  line((width/2) - 20, height/2, (width/2) + 20, height/2);
  line(width/2, (height/2) + 20, width/2, (height/2) - 20);
  hint(ENABLE_DEPTH_TEST);
}

void drawCoord() {
  hint(DISABLE_DEPTH_TEST);
  fill(255);
  textSize(40);
  textAlign(LEFT);
  text("XYZ: " + (int)playerCamera.camX + ", " + (int)playerCamera.camY + ", " + (int)playerCamera.camZ, 20, 50);

  int displayYaw = (int)degrees(playerCamera.yaw)% 360;
  if (displayYaw < 0) displayYaw += 360;
  text("Pitch-Yaw: " + (int)degrees(-playerCamera.pitch) + ", " + displayYaw, 20, 100);
  text("'V'  to unlock mouse", 20, 150);
  text("Current Seed: " + currentSeed, 20, 200);
  text("Press 'N' for New Seed", 20, 250);
  text("Press 'R' to Reload", 20, 300);
  hint(ENABLE_DEPTH_TEST);
}
