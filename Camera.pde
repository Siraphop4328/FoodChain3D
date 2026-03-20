class Camera
{

  float camX;
  float camY;
  float camZ;
  float yaw;
  float pitch;
  float velocityZ;
  float gravity;
  float jumpStrength;
  float spd;
  float sprintMult;
  float FLOOR_z;
  float smoothedGroundZ;

  boolean w, a, s, d, sp, sh;
  boolean TRAP_MOUSE;



  Camera() {

    camX = 0;
    camY = 0;
    camZ = 500;
    yaw = 180;
    pitch = 2.4;
    velocityZ = 0;
    gravity = 5.2;
    jumpStrength = 80;
    spd = 10;
    sprintMult = 2.5;
    FLOOR_z = -100;
    TRAP_MOUSE = true;
    smoothedGroundZ = 500;
  }


  void handleCamera ()
  {

    float currentGround = map1.getGroundHeight(camX, camY);
    float targetZ = currentGround + 50;

    smoothedGroundZ = lerp(smoothedGroundZ, targetZ, 0.2);


    velocityZ -= gravity;
    camZ += velocityZ;

    if (camZ < targetZ) {
      camZ = targetZ;
      if (velocityZ < 0) velocityZ = 0;
    }

    boolean onGround = camZ <= smoothedGroundZ + 2;
    if (onGround) {
      camZ = lerp(camZ, targetZ, 0.4);
      velocityZ = 0;
    }






    if (camZ <= FLOOR_z)
    {
      camZ = FLOOR_z;
      velocityZ = 0;
    }


    if (TRAP_MOUSE)
    {
      yaw += (mouseX - width / 2) * 0.003;
      pitch += (mouseY - height / 2) * 0.003;
      pitch = constrain (
        pitch, -HALF_PI + 0.0001,
        HALF_PI - 0.0001);

      r.warpPointer (width / 2, height / 2);
    }
    float fx = cos (yaw);
    float fy = sin (yaw);
    float currentSpd = sh ? spd * sprintMult : spd;
    if (w)
    {
      camX += fx * currentSpd;
      camY += fy * currentSpd;
    }
    if (s)
    {
      camX -= fx * currentSpd;
      camY -= fy * currentSpd;
    }
    if (a)
    {
      camX += cos (yaw - HALF_PI) * currentSpd;
      camY += sin (yaw - HALF_PI) * currentSpd;
    }
    if (d)
    {
      camX += cos (yaw + HALF_PI) * currentSpd;
      camY += sin (yaw + HALF_PI) * currentSpd;
    }
    if (sp && camZ <= targetZ + 1)
    {
      velocityZ = jumpStrength;
    }


    float lookX = camX + cos (yaw) * cos (pitch) * 100;
    float lookY = camY + sin (yaw) * cos (pitch) * 100;
    float lookZ = camZ - sin (pitch) * 100;

    camZ = constrain (camZ, FLOOR_z, 1000);

    camera (camX, camY, camZ, lookX, lookY, lookZ, // camera funtion
      0, 0, -1);

    perspective (radians(100), float (width) / height, 1,
      1000000); // adjust clipping distance

    lights (); // lights
  }
}
