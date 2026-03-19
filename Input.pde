void keyPressed() {
  if (key == 'w' || key == 'W') w = true;
  if (key == 's' || key == 'S') s = true;
  if (key == 'a' || key == 'A') a = true;
  if (key == 'd' || key == 'D') d = true;
  if (key == ' ' )              sp = true;
  if (keyCode == SHIFT)         sh = true;

  if (key == 'v' || key == 'V') {
    TRAP_MOUSE = !TRAP_MOUSE;
    r.confinePointer(TRAP_MOUSE);
    r.setPointerVisible(!TRAP_MOUSE);
  }

}

void keyReleased() {
  if (key == 'w' || key == 'W') w = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 'd' || key == 'D') d = false;
  if (key == ' ' )              sp = false;
  if (keyCode == SHIFT)         sh = false;
}
