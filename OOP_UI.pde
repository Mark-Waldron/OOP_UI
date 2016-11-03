Screen layout = new Screen();
Cursor click = new Cursor();
AI node = new AI();
Outline frame = new Outline();
Main_Menu upperMenu = new Main_Menu();
Home homePage = new Home();
Health vitals = new Health();

PFont mono;

float finalx = 750;
float finaly = 500;

float keyCount = 1.0;
float keyEntered = keyCount;
float count = 0;

void setup()
{
  //size(750, 500);
  fullScreen();
  frameRate(60);
  mono = loadFont("monospaced.plain-48.vlw");
  textFont(mono);
  smooth();
  background(#121212);
  layout.screenDraw();
  frame.hudOutline();
}//end setup

void draw()
{
  noFill();
  noCursor();
  background(#121212);
  layout.screenDraw();
  frame.hudOutline();
  switch((int)keyEntered)
  {
    case 1:
    {
      vitals.drawGraph();
      break;
    }
    case 2:
    {
      homePage.radar();
      break;
    }//end case 2
  }//end if
  //homePage.radar();
  //click.hover();
  //line(width / 2.0f, 0, width/2.0f, height);
  //line(0, height / 2.0f, width, height / 2.0f);
}//end draw

void keyPressed()
{
  if (keyCode == ENTER)
  {
    keyEntered = keyCount;
  }//end if
  if (keyCode == RIGHT)
  {
    keyCount += 1.0f;
  }//end if
  if (keyCode == RIGHT && keyCount == 5)
  {
    keyCount = 0;
  }
  if (keyCode == LEFT && keyCount == 0)
  {
    keyCount = 5;
  }
  if (keyCode == LEFT)
  {
    keyCount -= 1.0;
  }//end else if
}//end keyPressed