class Bullet
{
  PVector pos;
  PVector forward;
  float speed;
  
  Bullet(float x, float y, float speed)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.speed = speed;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    line(0, -2, 0, 2);
    popMatrix();
  }
  
  void update()
  {
    
    forward.x = 0;
    forward.y = -1;
    pos.add(PVector.mult(forward, speed));
  }
}