class Button
{
  Monitor monitor;
  PVector pos;
  PVector forward;
  float theta;
  float cx,cy;
  float x=600;
  float y=800;
  float size;
  char ID;
  boolean active;
  FlashColor flash;
  
  Button( float cx,float cy, float size, char ID, float theta)
  {
     monitor= new Monitor();
     flash=new FlashColor();
     pos = new PVector(x, y);
     forward = new PVector(0, -1);
     this.theta = theta;
      this.cx=cx;
      this.cy=cy;
      this.size=size;
      this.ID=ID;
      this.active = false;
  }
  
  void render()
  {
  
    if (this.active)
    {
      //monitor.display();
      action(ID);
      stroke(random(50,200),random(50,100),random(10,200));
      fill(0,0,255);
    }
    else{
      fill(255,20,255);
     }
      ellipse(cx,cy,size,size);
     
  }
  
  void OnClick()
  {
        if(overButton(cx,cy,size) & !this.active)
        {
            //make button class change color of button when clicked ect
            this.active = true;
          
        } 
        else if (overButton(cx,cy,size) & this.active) {
           this.active=false;
          //change color hide monitor
        }
      
   }
  
  boolean overButton (float cx,float cy, float radius)
  {
    float x=cx-mouseX;
    float y=cy-mouseY;
    if(sqrt(sq(x)+sq(y)) < radius){ 
      return true;
    }
    else{
      return false;
    }
    
    
   }
    
    void action(char ID) 
    {
      
      switch(ID){
        case 'L' :
        monitor.display();
        break;
        case 'R' :
        // radar 2 active
        break;
        //honing triangles
        case 'T':
        //FIRE!!
         PVector bp = new PVector(width-330, 2*height/4.); //PVector.add(pos, PVector.mult(forward, size + 2));
         Bullet b = new Bullet(bp.x, bp.y, 15 * 2);
         bullets.add(b);
         
         PVector bd = new PVector(width/3.2, 2*height/4.);
         Bullet bb = new Bullet(bd.x, bd.y, 15 * 2);
         bullets2.add(bb);
       // case 'B':
        
        //show earth
      }
  
    }





}