class Star{
  float x;
  float y;
  float z;
  
  float pz;

  
  Star()
  {
  
  x= random(0,width);
  y= random(0,height);
  z= random(width);
  pz=x;
  
  }
  
  void update()
  {
  z=z-speed;

  if(z<1)
    {
      z=width;
      x= random(-width/2,750);//-width/
      y= random(-height/2,height);
      pz=z;
    }
 
  }
  
  void show()
  {
  fill(255);
  noStroke();
  
  float sx= map(x/z,0,1,0,width);
  float sy= map(y/z,0,1,0,height);
  
  float r = map(z,0,width,15,0);
  ellipse(sx,sy,r,r);
  
  float px=map(x/pz,0,1,0,width);
  float py=map(y/pz,0,1,0,height);
  pz=z;
  
  stroke(255);
  line(px,py,sx,sy);
  
  }
}