class Radar
{
  float cx, cy;
  float radius;
  float theta;
  float speed;
  float frequency;
  color c;
  String shape;
  
  Radar(float cx, float cy, float radius, float frequency, color c, String shape)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
    this.speed = (TWO_PI / 60.0) * frequency;
    this.theta = 0;
    this.c = c;
    this.shape = shape;
  }
  
  void update()
  {
    theta += speed;
  }
  
  void render()
  {
    stroke(random(10,205), random(10,205),random(20,205));
    //noFill();
    fill(0,155,55,150);
    ellipse(cx, cy, radius * 2, radius * 2);
    int trailLength = 10;
    float greenIntensity = 255 / (float)trailLength;
    for(int i = 0 ; i < trailLength ; i ++)
    {
      if (shape.equals("circle")) { 
        stroke(0, i * greenIntensity, 0);
        float x = cx + sin(theta + speed) * radius/2.2; //i *
        float y = cy -cos(theta +  speed) * radius/2.2;
        ellipse(x, y,radius-5, radius-5);
      } else if (shape.equals("triangle")) {
        
        stroke(0, i * greenIntensity, 0);
        float x = cx + sin(theta + speed) * radius/3; //i *
        float y = cy -cos(theta +  speed) * radius/3;
        triangle(cx,cy,x,y-10,x,y+10);
      }
    }
  }
}