import processing.sound.*;

/*
  Creation of objects 
*/
Screen layout = new Screen();
Outline frame = new Outline();
Main_Menu upperMenu = new Main_Menu();
Home homePage = new Home();
Health vitals = new Health();
DateTime calendar = new DateTime();
Icons menuImages = new Icons();
Radio music = new Radio();

//Global font variable
PFont mono;

//Shapes
PShape radio;

PImage jfk;
float jfkWidth;
float jfkHeight;


//Inital width and heights to be used for map()
float finalx = 750;
float finaly = 500;
float widthHalf = 0;

float myWidth = 1366.0f;
float myHeight = 768.0f;


//Global variables that alter the menu
float keyCount = 2.0;
float keyEntered = keyCount;
float count = 0;
int change = 0;

//Global variable for the speed of the heart rate monitor
float graphCount;
/*
  Initalises program and is called once throughout runtime
*/

void setup()
{
  //size(750, 500);
  fullScreen();
  frameRate(60);
  mono = loadFont("monospaced.plain-48.vlw");
  
  jfk = loadImage("JFK_white.png");
  jfkWidth = map(jfk.width, 0, myWidth, 0, width);
  jfkHeight = map(jfk.height, 0, myHeight, 0, height);
  textFont(mono);
  smooth();
  
  menuImages.radio();
  println(width + " " + height);
  defaultSetup();
  
  widthHalf = map(finalx / 2.0f, 0, finalx, 0, width);
  graphCount = widthHalf + 0.0f;
}//end setup

/*
  The following function acts as the main and is called 60 per second
*/

void draw()
{
  //Default removal of fill and the cursor
  noFill();
  noCursor();
  
  //Swtich statement to change menu options
  switch((int)keyEntered)
  {
    //Health
    case 0:
    {
      defaultSetup();//Default setup call
      upperMenu.mainOptions();//Menu rendering
      music.test();
      change = 0;
      break;
    }//end case 0
    case 1:
    {
      if (change == 0)
      {
        defaultSetup();//Default setup call
        vitals.drawGraph();//Draws graph
        change++;//Ensures that graph is drawn once
      }//end if
      upperMenu.mainOptions();//Menu rendering
      vitals.heartRate(widthHalf);//Heart rate render
      break;
    }//end HEALTH case
    case 2:
    {
      defaultSetup();//Default setup call
      upperMenu.mainOptions();//Menu rendering
      homePage.radar();//Radar draw
      change = 0;//Heart Rate check
      break;
    }//end HOME case
    default:
    {
      defaultSetup();//Default setup call
      upperMenu.mainOptions();//Menu render
      change = 0;//Heart Rate check
    }//end default
  }//end if
}//end draw

/*
  Method that acts as the default screen layout
  This function is primarily called when a menu option
  is changed
*/

void defaultSetup()
{
  background(#121212);
  layout.screenDraw();//Curved Screen draw method
  frame.hudOutline();//Frame draw method
  calendar.clock();//Clock display method
}//end defaultSetup()