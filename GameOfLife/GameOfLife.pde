/*
conways game of life
Rules cell alive
2d array of boolean for board <2-> dies due to lonleyness >3 dies due to overpopulation
2 or 3== survival

if cell is dead
-> if exactally == 3 neighbours comes to life

2 boards previous and next board id rules to current, use on the nxt board

Warning this game of life is suicidal !

*/

void setup()
{ //<>//
  size(1000,1000);
  board = new Board(200);
  //frameRate(1);
}
Board board;

void draw()
{
  
  background(0);
  board.render();
  board.update();

  

}