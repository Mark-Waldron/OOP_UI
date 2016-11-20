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
    strokeWeight(lineSize / 2);
    
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
  float angle = 0.0f;
  float angle2 = 0.0f;
  int index = 0;
  void heartRate(float x1)
  {
    float widthEnd = map(592.5f, 0, finalx, 0, width);
    float h = height / 2.0f + map(22, 0, finaly, 0, height);
    float row = map(15.0f, 0, finaly, 0, height);
    float diff = row * 5.0f;
    float speed = map(1.0f, 0, finalx, 0, width);
    float minor = map(finalx / 6.0f, 0, finalx, x1, widthEnd);
    float spikeRange = map(finalx / 4.0f, 0, finalx,  x1, widthEnd);
    //float heightRange = map(150.0f, 0, 150.0f, h, h - diff);
    float BPM = map(90.0f, 0, finaly, 0, height);
    float angleHeight = map(BPM, 0, 150.0f, h, h + diff);
    float sinY []= new float [(int)(spikeRange - minor)];
    float at = atan((angleHeight - h)/(spikeRange - minor));
    
    for (float i = 0; i < (int)(spikeRange - minor); i+=1.0f)
    {
      sinY[(int)i] = (i * tan(at));
      println(degrees(at) + "gsdvda");
    }//end for
    
    stroke(green);
    strokeWeight(2.0f);
    
    graphCount += speed;
    
    //line(spikeRange, 0, spikeRange, height);
    line(minor, 0, minor, height);
    line((spikeRange - minor), 0, (spikeRange - minor), height);
    //line(0, angleHeight - h, width, angleHeight - h);
    
    if (graphCount >= minor && graphCount < spikeRange && index + 1< sinY.length)
    {
      line(graphCount, h - sinY[index], graphCount + speed, h - sinY[index + 1]);
      index++;
    }//end if
    else if (graphCount > spikeRange && index - 1 > -1)
    {
      line(graphCount, h - sinY[index], graphCount + speed, h - sinY[index - 1]);
      index--;
    }
    else if (graphCount >= spikeRange - speed && graphCount <= spikeRange + speed)
    {
      line(graphCount, h - sinY[sinY.length - 1], graphCount + speed, h - sinY[sinY.length - 1]);
    }//end else
    else
    {
      line(graphCount, h, graphCount + speed, h);
    }
    
    if ((graphCount + speed * 3.0f) > widthEnd)
    {
      graphCount = widthHalf;
      drawGraph();
      index = 0;
    }//end if
    
  }//end heartRate()
}//end CLASS Health