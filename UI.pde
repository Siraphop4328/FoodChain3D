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
  textSize(20);
  textAlign(LEFT);
  text("XYZ: " + (int)playerCamera.camX + ", " + (int)playerCamera.camY + ", " + (int)playerCamera.camZ, 20, 30);

  int displayYaw = (int)degrees(playerCamera.yaw)% 360;
  if (displayYaw < 0) displayYaw += 360;
  text("Pitch-Yaw: " + (int)degrees(-playerCamera.pitch) + ", " + displayYaw, 20, 80);
  hint(ENABLE_DEPTH_TEST);
}
