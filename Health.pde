class Health
{
  void drawGraph()
  {
    float h = height / 2.0f + map(22, 0, finaly, 0, height);
    float ten = map(15.0f, 0, finalx + finaly, 0, width + height);
    float widthEnd = map(592.5f, 0, finalx, 0, width);
    
    stroke(#006600);
    strokeWeight(1.0f);
    
    fill(0);
    rect(width / 2.0f, h - (ten * 5.0f), widthEnd - width / 2.0f, (ten * 10.0f));
    
    line(width / 2.0f, h, widthEnd, h);
    
    for (float i = 0; i < 6.0f; i+=1.0f)
    {
      line(width / 2.0f, h - (ten * i), widthEnd, h - (ten * i));
      line(width / 2.0f, h + (ten * i), widthEnd, h + (ten * i));
    }//end for
    
    line(width / 2.0f, h - (ten * 5.0f), width / 2.0f, h + (ten * 5.0f));
    line(widthEnd, h - (ten * 5.0f), widthEnd, h + (ten * 5.0f));
  }//end METHOD drawGraph()
  
  /*
    Draws line that will act as a heart rate monitor
  */
  
  void heartRate(float x1)
  {
    float angle1 = 0.0f;
    float space = 1.0f;
    float x2 = x1 + space;
    float angle2 = angle1 + space;
    
    strokeWeight(2.0f);
    
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
    }//end else
    
    x2+=space;
    x1+=space;
  }//end heartRate()
}//end CLASS Health

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