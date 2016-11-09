Screen layout = new Screen();
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
int change = 0;

float graphCount = 0.0f;

void setup()
{
  //size(750, 500);
  fullScreen();
  frameRate(60);
  mono = loadFont("monospaced.plain-48.vlw");
  textFont(mono);
  smooth();
  defaultSetup();
}//end setup

void draw()
{
  noFill();
  noCursor();
  
  switch((int)keyEntered)
  {
    case 1:
    {
      if (change == 0)
      {
        defaultSetup();
        vitals.drawGraph();
        change++;
      }//end if
      upperMenu.mainOptions();
      vitals.heartRate(width / 2);
      break;
    }
    case 2:
    {
      defaultSetup();
      upperMenu.mainOptions();
      homePage.radar();
      change = 0;
      break;
    }//end case 2
    default:
    {
      defaultSetup();
      upperMenu.mainOptions();
    }
  }//end if
}//end draw

void defaultSetup()
{
  background(#121212);
  layout.screenDraw();
  frame.hudOutline();
  calendar.clock();
}//end defaultSetup()