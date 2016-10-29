Screen layout = new Screen();
Cursor click = new Cursor();
AI node = new AI();
Outline frame = new Outline();
Main_Menu upperMenu = new Main_Menu();

PFont mono;

float finalx = 750;
float finaly = 500;

float keyCount = 2.0;

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
  upperMenu.mainOptions();
}//end setup

void draw()
{
  noFill();
  //noCursor();
  upperMenu.mainOptions();
  //click.hover();
  //line(width / 2.0f, 0, width/2.0f, height);
  //line(0, height / 2.0f, width, height / 2.0f);
  println(mouseX + " " + mouseY);
}//end draw

void keyPressed()
{
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