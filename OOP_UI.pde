Screen layout = new Screen();
Cursor click = new Cursor();
AI node = new AI();
Outline frame = new Outline();

PFont mono;

float finalx = 750;
float finaly = 500;

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
  //click.hover();
  //line(width / 2.0f, 0, width/2.0f, height);
  //line(0, height / 2.0f, width, height / 2.0f);
  //println(mouseX + " " + mouseY);
}//end draw