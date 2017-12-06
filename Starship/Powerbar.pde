class Powerbar
{
    float x,y;
    float limit;
    Powerbar(float x,float y)
    {
    this.x=x;
    this.y=y;
    
    
    }
    
    void render()
    {
      fill(0,255,0);
      rect(x,y,x*8,y/9);
      limit=map(mouseX,0,width,x/2-10,y/2-170);
      fill(1);
      rect(x+10,y+9,x+limit,y/12);
    }

    void update()
    {
      
    }


}