import ddf.minim.*; //import minum library

Minim minim;   //audio context
AudioPlayer player;

Star[] stars=new Star[800];       //create star array
Animation animation1;            //initialise animation 
//Monitor monitor;
Radar radar1;
Radar radar2;
float speed;
float xpos, ypos;
float drag = 2.0;
Button button;
Button buttonR;
Button buttonT;
Button buttonB;
FlashColor flash;
Powerbar bar;

void setup()
{
  //monitor= new Monitor();
  button = new Button(730, height-250, 50, 'L', 0);
  buttonR = new Button(910, height-250, 50, 'R', 0);
  buttonT = new Button(820, height-350, 50, 'T', 0);
  buttonB = new Button(820, height-140, 50, 'B', 0);
  radar1 = new Radar(width/4.5, 740, 100, 0.5, color(255, 0, 255), "circle");
  radar2 = new Radar(width/2, 280, 100, 0.5, color(0, 0, 255), "triangle");
  flash=new FlashColor();
  bar=new Powerbar(40, 860);


  size (1000, 1000);
  strokeWeight(4);
  linex=0;

  //first song
  minim = new Minim(this);
  player= minim.loadFile("Space-Unicorn-Parry-Gripp-and-Brianne-Drouhard.mp3");

  //animation arguements 
  frameRate(100);
  animation1= new Animation("spaceunicorn", 4);
  ypos=height*0.15;

  //loop for stars
  for (int i=0; i<stars.length; i++)
  {
    stars[i]=new Star();
  }
}

float linex, liney;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Bullet> bullets2 = new ArrayList<Bullet>();

void draw()
{
  background(211, 211, 211);



  //stars displayed here
  if (mouseX >100)
  {
    speed=map(mouseX, 200, 700, 10, 50);//change width to prizm between 200 and 700
  }
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }


  //dash board base undo the translate from the stars so the board is centered
  translate((2-width)/2, (2-height)/2);
  dashboard();

  //display radar  
  radar1.render();
  radar1.update();

  if (buttonR.active) {
    radar2.render();
    radar2.update();
  }
  stroke(random(10, 230), random(10, 50), random(20, 60));

  //monitor controls
  //mouseClicked();
  button.render();
  //button.OnClick();
  buttonR.render();
  buttonT.render();
  buttonB.render();



  for (int i=bullets.size()-1; i>=0; i--)
  {
    Bullet b =bullets.get(i);
    flash.colorchange();
    b.update();
    b.render();
  }
  
  for (int i=bullets2.size()-1; i>=0; i--)
  {
    Bullet bb = bullets2.get(i);
    flash.colorchange();
    bb.update();
    bb.render();
  }

  bar.render();
  //space unicorn button play the song when triangle pressed!
  fill(random(10, 230), random(10, 50), random(20, 60));
  stroke(random(50, 200), random(50, 100), random(10, 200));
  triangle(850, 800, 790, 800, 820, 700);
  float dx=  200 - xpos;
  xpos =xpos + dx/drag;
  int counter=0;
  if (mousePressed)
  {
    if (mouseX<850 && mouseX>790 && mouseY<800 && mouseY>700)
    {
      if (counter>0)
      {
        player.pause();
      } else
      {
        player.play();
        counter=+1;
        //println(counter);
      }
    }
  }
  if (mouseX<850 && mouseX>790 && mouseY<800 && mouseY>700)
  {
    animation1.display(xpos-animation1.getWidth()/2, ypos);
  }
}

void dashboard()
{
  //dash board base
  stroke(211);
  fill(211, 211, 211);

  stroke(0);

  arc(780, 600, 300, 300, -PI / 4, PI / 4); // 60 degrees
  arc(780, 600, 300, 300, -PI, 0);  // upper half of circle

  // stroke(random(50,200),random(50,100),random(10,200));
  //arc(780, 630, 290, 290, -PI, 0);
  //arc(780, 660, 280, 290, -PI, 0);

  stroke(0);
  fill(0);
  arc(710, 590, 250, 200, -PI / 1, PI / 1); // 60 degrees
  arc(710, 590, 250, 200, -PI, 0);  // upper half of circle

  fill(211, 211, 211);
  stroke(211);
  ellipse(800, 800, 400, 400);//right large circle
  rect(0, 680, width, 900);
  fill(0);
  stroke(0);
  ellipse(20, 690, 50, 50);
  ellipse(990, 690, 45, 45);//little circles on either side
  fill(211, 211, 211);
  ellipse(200, 600, 300, 300);

  //need a loop for veins change color as mouse moves cross the board

  //stroke(random(50,200),random(50,100),random(10,200));
  // arc(190, 579, 190, 110, PI / 2, 3 * PI / 2); // 180 degrees
  //arc(130, 582, 200, 110, PI / 2, 3 * PI / 2); // 180 degrees

  stroke(0);
  fill(0);
  arc(270, 605, 260, 110, -PI / 1, PI / 1); // 60 degrees
  arc(270, 605, 260, 200, -PI, 0);  // upper half of circle

  stroke(211);
  fill(211, 211, 211);
  ellipse(210, 800, 400, 400);

  stroke(random(0, 250), random(0, 250), random(0, 250));
  fill(211, 211, 211);
  ellipse(500, 860, 190, 190); //underprizm circle
  int offset = 90;
  int staredge =50;

  line(500-offset-staredge, 860-offset-staredge, 500-offset, 860-offset);
  line(500+offset+staredge, 860+offset+staredge, 500+offset, 860+offset);
  line(500+offset+staredge, 860-offset-staredge, 500+offset, 860-offset);
  line(500-offset-staredge, 860+offset+staredge, 500-offset, 860+offset);

  offset=50;
  line(820-offset-staredge, 760-offset-staredge, 820-offset, 760-offset);
  line(820+offset+staredge, 760+offset+staredge, 820+offset, 760+offset);
  line(820+offset+staredge, 760-offset-staredge, 820+offset, 760-offset);
  line(820-offset-staredge, 760+offset+staredge, 820-offset, 760+offset);




  // the central control prizm

  fill(200, 200, 200, 63);
  stroke(random(50, 200), random(50, 100), random(10, 200));

  triangle(500, 900, 625, 700, 390, 700);
  triangle(500, 540, 625, 700, 390, 700);

  line(500, 540, linex+390, 700);
  line(500, 900, linex+390, 700);
  line(500, 900, liney+570, 700);
  line(500, 540, liney+570, 700);


  linex+=0.5;
  liney+=0.5;
  if (dist(510, 510, mouseX, mouseY)<250)
  {

    triangle(500, 900, 625, 700, mouseX, mouseY);
    triangle(500, 540, 625, 700, mouseX, mouseY);
  }
  //rotation of prizm
  if (linex>70)
  {
    linex=0;
  }

  if (liney>50)
  {

    liney=0;
  }
}

void mouseClicked()
{
  button.OnClick();
  buttonR.OnClick();
  buttonT.OnClick();
}