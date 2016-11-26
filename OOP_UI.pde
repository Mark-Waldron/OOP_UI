//Library Imports
import processing.sound.*;
import java.util.Date;
import java.text.SimpleDateFormat;

//Arraylist to host the sound files
ArrayList<SoundFile> playlist = new ArrayList<SoundFile>();
ArrayList<DataFile> data = new ArrayList<DataFile>();
String files[] = {"HoundDog.mp3", "Fire.mp3", "Care.mp3", "Gypsy.mp3"};

/*
  Creation of objects 
*/
Screen layout = new Screen();
Outline frame = new Outline();
Main_Menu upperMenu = new Main_Menu();
Home homePage = new Home();
Health vitals = new Health();
DateTime calendar = new DateTime();
Radio music = new Radio();
Ship struct = new Ship();
DisplayData statistic = new DisplayData();

/*
  Global declarations (EWW!!!)
*/

//Table
Table t;

//Global font variable
PFont mono;

//Shapes
PShape radio;

//Colour
color green = #20C20E;

String dateString;

//Images
PImage jfk;
float jfkWidth;
float jfkHeight;

//Inital width and heights to be used for map()
float finalx = 750;
float finaly = 500;
float widthHalf;

//Dev Width and Height
float myWidth = 1366.0f;
float myHeight = 768.0f;

float lineSize = 2.0f;

//Averages and calculation variables
int healthAverage;
float engineAverage;
float shieldAverage;
float oxyAverage;
float tempAverage;
float reactorAverage;

float enginePer = 0;
float shieldsPer = 0;
float oxPer = 0;
float tempPer = 0;
float reactPer = 0;

//Global variables that alter the menu
float keyCount = 2.0;
float keyEntered = keyCount;
float count = 0;
int change = 0;

//Radio Menu
float radioToggle = 3.0f;
float theta = 0.0f;

//Play check
boolean play = false;

//Global variable for the speed of the heart rate monitor
float graphCount;

//Changes to graph
int dataToggle = 0;

//Ship
float reactorR1 = 0.0f;
float reactorR2 = TWO_PI;
float reactorR3 = 0.0f;

/*
  Initalises program and is called once throughout runtime
*/

void setup()
{
  size(750, 500);
  //fullScreen();
  frameRate(60);
  mono = loadFont("monospaced.plain-48.vlw");
  textFont(mono);
  smooth();
  //noCursor();
  
  Date date = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("EEE, MMM dd HH:mm:ss z yyyy");
  dateString = sdf.format(date);
  //println("now formatted to = " + dateString); 
  
  jfk = loadImage("JFK_white.png");
  jfkWidth = map(jfk.width, 0, myWidth, 0, width);
  jfkHeight = map(jfk.height, 0, myHeight, 0, height);
  
  //Calculations for the heart rate monior
  widthHalf = map(finalx / 2.0f, 0, finalx, 0, width);
  graphCount = widthHalf + 0.0f;
  
  //Loading of sound files
  loadSongs();
  loadFile();
  loadAverages();
  
  homePage.setUp();
  //menuImages.radio();
  defaultSetup();
  struct.statusSetup();
  struct.infoChange();
  vitals.defaultSetup();
  vitals.setupRate();
}//end setup

/*
  The following function acts as the main and is called 60 per second
*/

void draw()
{
  //Default removal of fill and the cursor
  noFill();
  
  //Changes statistics
  if (frameCount % 10 == 0)
  {
    struct.infoChange();
  }//end barChart()

  //Swtich statement to change menu options
  switch((int)keyEntered)
  {
    //Health
    case 0:
    {
      defaultSetup();//Default setup call
      upperMenu.mainOptions();//Menu rendering
      music.test();
      
      vitals.changeBPM();
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
      vitals.heartRate();//Heart rate render
      break;
    }//end HEALTH case
    case 2:
    {
      defaultSetup();//Default setup call
      upperMenu.mainOptions();//Menu rendering
      homePage.radar();//Radar draw
      
      change = 0;//Heart Rate check
      vitals.changeBPM();
      break;
    }//end HOME case
    case 3:
    {
      defaultSetup();//Default setup call
      upperMenu.mainOptions();//Menu rendering
      
      //Draws data
      struct.reactor();
      
      change = 0;//Heart Rate check
      vitals.changeBPM();
      break;
    }//end case 3
    case 4:
    {
      defaultSetup();//Default setup call
      upperMenu.mainOptions();//Menu rendering
      statistic.loadGraphData();
      
      //Swtiches data to display
      switch(dataToggle)
      {
        case 0:
        {
          statistic.Health();
          break;
        }//end case 0
        case 1:
        {
          statistic.Engine();
          break;
        }//end case 0
        case 2:
        {
          statistic.Fuel();
          break;
        }//end case 0
        case 3:
        {
          statistic.Shields();
          break;
        }//end case 0
        case 4:
        {
          statistic.Oxygen();
          break;
        }//end case 0
        case 5:
        {
          statistic.Reactor();
          break;
        }//end case 0
      }//end swtich dataToggle
      
      vitals.changeBPM();
      change = 0;//Heart Rate check
      break;
    }
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
  graphCount = widthHalf;
  vitals.index = 0;
}//end defaultSetup()

/*
  Loads mp3 files into a arraylist
*/

void loadSongs()
{
    for(int i = 0; i < files.length; i++)
    {
      playlist.add(new SoundFile(this, files[i]));
    }
    //playlist.get(1).play();
}//end loadSongs

/*
  Loads the data file that keeps the log history into a table
*/

void loadFile()
{
  t = loadTable("data.csv", "header");
  
  //CLearing of data
  data.clear();
  
  for (int i = 0; i < t.getRowCount(); i++)
  {
    DataFile rowFetch = new DataFile(t.getRow(i));
    data.add(rowFetch);
  }//end for
}//end loadFile()

/*
  Loads the last record average into the current averages
*/

void loadAverages()
{
  enginePer = data.get(data.size() - 1).Engine;
  shieldsPer = data.get(data.size() - 1).Shields;
  oxPer = data.get(data.size() - 1).Oxygen;
  tempPer = data.get(data.size() - 1).Temp;
  reactPer = data.get(data.size() - 1).Reactor;
}//end loadAverages