void handleCamera(){
  if (TRAP_MOUSE) {                                                                                 
  yaw += (mouseX - width/2) * 0.003;                                                                
  pitch += (mouseY - height/2) * 0.003;
  pitch = constrain(pitch, -HALF_PI + 0.0001, HALF_PI - 0.0001);               // limit how much you can look up and down but i add a small - and + so it wont buggy                     
  r.warpPointer(width/2, height/2);                                            // make mouse stay at center
  }
  float fx = cos(yaw);
  float fy = sin(yaw);
  if (w) { camX += fx * spd; camY += fy * spd; }                                                      
  if (s) { camX -= fx * spd; camY -= fy * spd; }  
  if (a) { camX += cos(yaw - HALF_PI) * spd; camY += sin(yaw - HALF_PI) * spd; }
  if (d) { camX += cos(yaw + HALF_PI) * spd; camY += sin(yaw + HALF_PI) * spd; }
  if (sp) camZ += spd;
  if (sh) camZ -= spd;

  float lookX = camX + cos(yaw) * cos(pitch) * 100;
  float lookY = camY + sin(yaw) * cos(pitch) * 100;
  float lookZ = camZ - sin(pitch) * 100;

  camZ = constrain(camZ, FLOOR_z, 1000);

  camera(camX, camY, camZ,
         lookX, lookY, lookZ,                       // camera funtion
         0, 0, -1);

  perspective(PI/3, float(width)/height, 1, 1000000);  // adjust clipping distance

  lights();   // lights
}
