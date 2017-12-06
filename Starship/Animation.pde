class Animation{
  
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count){
    imageCount = count;
    images=new PImage[imageCount];
    
    for(int i=0;i<imageCount;i++)
    {
      //use nf() to number format i into four didgits not working cannot find file spaceunicorn0036
      String filename=imagePrefix+i+".PNG";
      images[i]=loadImage(filename);
    }
  }
  
  void display(float xpos, float ypos)
  {
    frame=(frame+1)%imageCount;
    image(images[frame],xpos,ypos);
  }
  
  int getWidth(){
    return images[0].width;
  }
}