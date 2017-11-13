class Board
{
  boolean[][] current;
  boolean[][] next;
  
  int size;
  
  float cellSize;
  
  Board(int size)
  {
    this.size=size;
    current = new boolean[size][size];
    next = new boolean[size][size];  
    cellSize = width/ (float) size;
    
    randomise();
  }
  
  void render()
{
    for(int row=0; row<size; row++)
    {
      for(int col=0; col<size; col++)
      {
        if(current[row][col])
        {
         fill(255,0,255); 
        }
        else
        {
          fill(0);
        }
        
        float x=map(col,0,size,0,width);
        float y=map(row,0,size,0,height);
        
        rect(x, y, cellSize-1, cellSize -1);
        
      }
    }
    
}
  
  void randomise()
{
    for(int row=0; row<size; row++)
    {
      for(int col=0; col<size; col++)
      {
        int dice = (int) random(0,2);
        current[row][col] = (dice==1);
      }
    
    }
  
}
  
/*  void mouseDragged()
  {
    if(mousePressed)
    {  
      current[mouseX][mouseY]=true;
    }
  
  }*/
  
  boolean isAlive(int row, int col)
  {
    if (row < 0 || row >= size || col < 0 || col >= size)
    {
      return false;
    }
    else{
        return current[row][col];
     }
  }
  
 int getLiveNeighbours(int row, int col)
{
  int live=0;
 
  
     for(int x = row - 1 ; x <= row + 1 ; x ++)
      {
        for(int y = col - 1 ; y <= col + 1 ; y ++)
        {
          if(! (x == row && y == col) && isAlive(x,y))
              {
               live++;
               }
         }
       }
    return live;
 
}//end get live neightbours
  
  
  void update()
{
    
    for(int row = 0 ; row < size ; row ++)
    {
      for(int col = 0 ; col < size ; col ++)
      {
            int liveNeighbours = getLiveNeighbours(row, col);
            if(current[row][col])
            {  
                if(liveNeighbours==2 || liveNeighbours==3)
                {
                  next[row][col] = true;
                }
                else{
                     next[row][col]= false;
                }
              }
                
             else{
               
                  if(liveNeighbours==3)
                  {
                    next[row][col] = true;
                  }
                  else{
                      next[row][col] = false;
                    }
               }  
            }
        }
      
    

   boolean[][] temp;
   temp = current;
   current = next;
   next = temp;
   
}
  

}