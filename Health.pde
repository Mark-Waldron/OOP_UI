class Health
{
  ArrayList<Float> coY = new ArrayList<Float>();
  
  int index = 0;
  
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
  
  void heartRate(float x1)
  {
    float widthEnd = map(592.5f, 0, finalx, 0, width);
    float h = height / 2.0f + map(22, 0, finaly, 0, height);
    float row = map(15.0f, 0, finaly, 0, height);
    float diff = row * 5.0f;
    float graphUp = h - diff;
    float speed = 1.0f;
    float minor = map(finalx / 7.0f, 0, finalx, x1, widthEnd);
    float spikeRange = map(finalx / 5.0f, 0, finalx,  x1, widthEnd);
    
    //float primRange = 
    
    //float heightRange = map(150.0f, 0, 150.0f, h, h - diff);
    float angleHeight = map(60.0f, 0.0f, 150.0f, graphUp, graphUp + diff);
    float at = atan((angleHeight - graphUp)/(spikeRange - minor));
    
    for (float i = 0; i <= (spikeRange - minor) + 1; i += 1.0f)
    {
      coY.add(i * tan(at));
      //println(degrees(at) + "gsdvda");
      //stroke(green);
      //line(0, h - sinY[(int)i], width, h - sinY[(int)i]);
    }//end for
    
    stroke(green);
    strokeWeight(1.0f);
    
    graphCount += speed;
    
    //line(spikeRange, 0, spikeRange, height);
    //line(minor, 0, minor, height);
    //line((spikeRange - minor), 0, (spikeRange - minor), height);
    //line(0, angleHeight - h, width, angleHeight - h);
    
    //line(0, graphUp, width, graphUp);
    //line(0, graphUp + diff * 2.0f, width, graphUp + diff * 2.0f);
    
    
    if (graphCount >= minor && graphCount < spikeRange && index + 1 < coY.size())
    {
      line(graphCount, h - coY.get(index), graphCount + speed, h - coY.get(index + 1));
      index++;
    }//end if
    else if (graphCount > spikeRange && index - 1 > -1)
    {
      line(graphCount, h - coY.get(index), graphCount + speed, h - coY.get(index - 1));
      index--;
    }
    else if (graphCount >= spikeRange - speed && graphCount <= spikeRange + speed)
    {
      line(graphCount, h - coY.get(coY.size() - 1), graphCount + speed, h - (coY.size() - 1));
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