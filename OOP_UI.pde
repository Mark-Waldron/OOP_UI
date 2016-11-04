Screen layout = new Screen();
AI node = new AI();
Outline frame = new Outline();
Main_Menu upperMenu = new Main_Menu();
Home homePage = new Home();
Health vitals = new Health();
DateTime calendar = new DateTime();

PFont mono;

float finalx = 750;
float finaly = 500;

float keyCount = 1.0;
float keyEntered = keyCount;
float count = 0;

void setup()
{
  size(750, 500);
  //fullScreen();
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
  
  defaultSetup();
  
  switch((int)keyEntered)
  {
    case 1:
    {
      vitals.drawGraph();
      vitals.heartRate(width / 2);
      break;
    }
    case 2:
    {
      homePage.radar();
      break;
    }//end case 2
  }//end if
}//end draw

void defaultSetup()
{
  background(#121212);
  layout.screenDraw();
  frame.hudOutline();
  calendar.clock();
}//end defaultSetup()