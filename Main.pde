import com.jogamp.newt.opengl.GLWindow;
GLWindow r;

Map map1;
Camera playerCamera;
int FPS = 30;

void setup() {

  size(1920, 1200, P3D);
  frameRate(FPS);
  playerCamera = new Camera();
  map1 = new Map(10, 10);
  windowTitle("FishFind3D");
  r = (GLWindow) surface.getNative();
  r.confinePointer(true);
  r.setPointerVisible(false);

  int x = (displayWidth - width) / 2;
  int y = (displayHeight - height) / 2;
  surface.setLocation(x, y);
  println(displayWidth);
  println(displayHeight);
  println(width);
  println(height);
}

void draw() {

  playerCamera.handleCamera();
  map1.changeSkyColor(playerCamera.camZ);
  map1.drawMap();
  camera();
  noLights();
  drawUI();
}
