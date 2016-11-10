float angle = 0.0f;
class Health
{
  /*
    Method to draw the heart rate monitor's backrgound
  */
  
  void drawGraph()
  {
    float ten = map(15.0f, 0, finaly, 0, height);
    float widthEnd = map(592.5f, 0, finalx, 0, width);
    float h = height / 2.0f + map(22, 0, finaly, 0, height);
    
    stroke(0, 61.0f, 0);
    strokeWeight(1.0f);
    
    //fill(0);
    //rect(width / 2.0f, h - (ten * 5.0f), widthEnd - width / 2.0f, (ten * 10.0f));
    
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
    float widthEnd = map(592.5f, 0, finalx, 0, width);
    float h = height / 2.0f + map(22, 0, finaly, 0, height);
    float row = map(15.0f, 0, finaly, 0, height);
    float diff = row * 5.0f;
    float speed = map(1.0f, 0, finalx, 0, width);
    float minor = map(finalx / 6.0f, 0, finalx, x1, widthEnd);
    float spikeRange = map(10.0f, 0, finalx, 0, width);
    //float heightRange = map(150.0f, 0, 150.0f, h, h - diff);
    float angleHeight = map(30.0f, 0, 150.0f, h, h - diff);
    
    float at = atan(angleHeight/(minor));
    
    stroke(#006600);
    strokeWeight(1.0f);
    
    line(minor, 0, minor, height);
    line(minor - spikeRange, 0, minor - spikeRange, height);
    line(minor + spikeRange, 0, minor + spikeRange, height);
    
    line(0, angleHeight, width, angleHeight);
    
    //strokeWeight(2.0f);
    
    if ((graphCount + speed) < (minor - spikeRange) || (graphCount + speed) > (minor + spikeRange))
    {
      graphCount += speed;
      line (graphCount, h, graphCount + speed, h);
    }///end if
    else if ((graphCount + speed) >= (minor - spikeRange) && (graphCount + speed) < (minor))
    {
      graphCount += speed;
      line(graphCount, h - (angle * tan(at)), graphCount + speed, h - ((angle + speed) * tan(at)));
      angle += speed;
    }//end else
    else if ((graphCount + speed) >= minor && (graphCount + speed) <= (minor + spikeRange))
    {
      graphCount += speed;
      line(graphCount, h - ((angle + speed) * tan(at)), graphCount + speed, h - (angle * tan(at)));
      angle -= speed;
    }
    
    //line(x1, (height / 2.0f) - angle1 * tan(TWO_PI/12), x2, (height / 2.0f) -angle2 * tan(TWO_PI/12));
    if ((graphCount + speed * 2.0f) > widthEnd)
    {
      graphCount = width / 2.0f;
      fill(0);
      stroke(0);
      rect(x1, h - diff, widthEnd - x1, diff * 2.0f);
      drawGraph();
      angle = 0.0f;
      //defaultSetup();
    }//end if
    
  }//end heartRate()
}//end CLASS Health