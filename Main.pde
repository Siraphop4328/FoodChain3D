import com.jogamp.newt.opengl.GLWindow;
GLWindow r;

Map map1;
Camera playerCamera;
int FPS = 45;

void setup() {

  size(1980, 1200, P3D);
  frameRate(FPS);
  playerCamera = new Camera();
  map1 = new Map(10, 10);
  windowTitle("FishFind3D");
  r = (GLWindow) surface.getNative();
  r.confinePointer(true);
  r.setPointerVisible(false);
}

void draw() {

  playerCamera.handleCamera();
  map1.changeSkyColor(playerCamera.camZ);
  map1.drawMap();
  camera();
  noLights();
  drawUI();
}
