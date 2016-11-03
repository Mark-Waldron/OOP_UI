class Health
{
  void drawGraph()
  {
    stroke(255);
    line(width / 2.0f, height / 2.0f + map(22, 0, finaly, 0, height), map(592.5f, 0, finalx, 0, width), height / 2.0f + map(22, 0, finaly, 0, height));
  }//end drawGraph()
}//end class Health

/*
void setup()
{
  //size(750,500);
  fullScreen();
  background(0);
  stroke(255);
  frameRate(60);
}//end setup

float x1 = 0;
float angled1 = 0.0f;
float angle1 = 0;

void draw()
{
  float space = 1.0f;
  float x2 = x1 + space;
  float angle2 = angle1 + space + 1.0f;
  
  if (x2 > 100.0f &&  x2 <= 120.0f)
  {
    line(x1, (height / 2.0f) - angle1 * tan(TWO_PI/12), x2, (height / 2.0f) -angle2 * tan(TWO_PI/12));
    angle1+=3.0f;
    angle2+=3.0f;
  }//end if
  else if (x2 > 120.0f &&  x2 <= 140.0f)
  {
    angle1-=3.0f;
    angle2-=3.0f;
    line(x1, (height / 2.0f) - angle2 * tan(TWO_PI/12), x2, (height / 2.0f) - angle1 * tan(TWO_PI/12));
  }//end else if
  else
  {
    line (x1, height / 2.0f, x2, height / 2.0f);
  }
  x2+=space;
  x1+=space;
  
  
}//end draw
*/