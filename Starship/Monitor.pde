class Monitor
{
  float cx=width/2;
  float cy=height/3.5;
  float size=370;
  void display()
  {
    noFill();
    stroke(random(50,200),random(50,100),random(10,200));
    ellipse(cx,cy,size,size);
    ellipse(cx,cy,size*0.9,size*0.9);
    
    line(150,50,width-150,50);
    line(150,50,50,100);
    line(50,100,50,450);
    line(50,450,150,500);
    line(width-150,50,950,100);
    line(950,100,950,450);
    line(950,450,850,500);
    line(150,500,width-150,500);


    noStroke();
    
      beginShape();
      fill(211,211,211,100);
      vertex(850,50);
      vertex(150,50);
      vertex(50,100);
      vertex(50,450);
      vertex(150,500);
      vertex(width-150,50);
      vertex(950,100);
      vertex(950,450);
      vertex(width-150,500);
      vertex(150,500);
    endShape();
    
    stroke(211,211,211);
    line(190,90,width-200,90);
    
    float tline=map(mouseX,0,width-30,10,550);
    println(tline);
    triangle(190+tline,60,210+tline,90,230+tline,60);
  }
  void tracker()
  {
    stroke(0);
      int offset = 30;
      int staredge =90;
    ellipse(cx,cy, size/2,size/2);
    //needs new Radar with triangles rather than circles how???
    
  //line(450-offset-staredge, cx-offset-staredge, 500-offset, cy-offset);
  //line(450+offset+staredge, cx+offset+staredge, 500+offset, cy+offset);
  //line(450+offset+staredge, cx-offset-staredge, 500+offset, cy-offset);
  //line(450-offset-staredge, cx+offset+staredge, 500-offset, cy+offset);
  
  
  }

}