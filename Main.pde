import com.jogamp.newt.opengl.GLWindow;  // library so i can lock the mouse and hide it
GLWindow r;

float camX = 0;              
float camY = 0;                         ///////// camera position xyz
float camZ = 200;       

float yaw = 180;
float pitch = 2.4;
boolean w, a, s, d, sp, sh;             // booleans
float spd = 2;                          // player speed

float FLOOR_z = 10;                     // sea floor level
boolean TRAP_MOUSE = true;              // mouse is locked or not


void setup() {
  
  size(1980, 1200, P3D);                // windowed but full screen on my laptop screen
  windowTitle("FishFind3D");
  r = (GLWindow) surface.getNative();
  r.confinePointer(true);
  r.setPointerVisible(false);
  
  
}

void draw() {
  background(111, 165, 179);
 
  handleCamera(); // function in Camera.pde
  drawMap();   // function in Map.pde


  camera(); // call this to reset camera
  noLights();
  
  drawUI();  // function in UI.pde


}
