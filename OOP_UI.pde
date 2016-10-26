Screen layout = new Screen();
Cursor click = new Cursor();
AI node = new AI();

PFont mono;

float finalx = 750;
float finaly = 500;

void setup()
{
  size(750, 500);
  //fullScreen();
  frameRate(60);
  mono = loadFont("monospaced.plain-48.vlw");
  strokeWeight(2);
  textFont(mono);
  smooth();
}//end setup

void draw()
{
  background(#121212);
  noFill();
  layout.screenDraw();
  fill(0);
  node.caller();
  noCursor();
  //click.hover();
  //line(width / 2.0f, 0, width/2.0f, height);
  //line(0, height / 2.0f, width, height / 2.0f);
  println(mouseX + " " + mouseY);
}//end draw