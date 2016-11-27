class Health
{
  //Array lists to hold the co-orindates of the spike values
  ArrayList<Float> coY = new ArrayList<Float>();
  ArrayList<Float> bigCoY = new ArrayList<Float>();
  
  float widthEnd;
  float h;
  float row;
  float diff;
  float graphUp;
  float speed;
  float minor;
  float spikeRange;
  float majorDiv;
  float centreSpike;
  float angleHeight;
  float at;
  
  float angleHeight2;
  float bigAT;
  
  int index;
  int index2;
  
  int BPM;
  
  void defaultSetup()
  {
    this.widthEnd = map(592.5f, 0, finalx, 0, width);
    this.h = height / 2.0f + map(22, 0, finaly, 0, height);
    this.row = map(15.0f, 0, finaly, 0, height);
    this.diff = row * 5.0f;
    this.graphUp = h - diff;
    this.speed = 1.0f;
    this.minor = map(finalx / 7.0f, 0, finalx, widthHalf, widthEnd);
    this.spikeRange = map(finalx / 5.0f, 0, finalx,  widthHalf, widthEnd);
    this.majorDiv = map(300, 0, finalx, widthHalf, widthEnd);
    this.centreSpike = map(380, 0, finalx, widthHalf, widthEnd);
  }//end defaultSetup()
  
  void setupRate()
  {
    this.BPM = (int)random(70, 120);
    this.angleHeight = map(random(40, 45), 0.0f, 150.0f, graphUp, graphUp + diff);
    this.at = atan((angleHeight - graphUp)/(spikeRange - minor));
    
    this.angleHeight2 = map((float)BPM, 0.0f, 150.0f, graphUp, graphUp + diff);
  
    this.bigAT = atan((angleHeight2 - graphUp)/(centreSpike - majorDiv));
    
    this.index = 0;
    this.index2 = 0;
    
    coY.clear();
    bigCoY.clear();
    
    healthAverage = (healthAverage + BPM) / 2;
    
    for (float i = 0; i <= (spikeRange - minor) + 1; i += 1.0f)
    {
      coY.add(i * tan(at));
      //println(degrees(at) + "gsdvda");
      //stroke(green);
      //line(0, h - sinY[(int)i], width, h - sinY[(int)i]);
    }//end for
    
    for (float i = 0; i <= (centreSpike - majorDiv) + 1; i += 1.0f)
    {
      bigCoY.add(i * tan(bigAT));
    }//end for
  }
  
  /*
    Method to draw the heart rate monitor's backrgound
  */
  
  void drawGraph()
  {
    float ten = row;
    float rangeNum = 0;
    
    fill(0);
    noStroke();
    
    rect(width / 8.0f, h - (ten * 5.0f), widthEnd - (width / 8.0f), (ten * 10.0f));
    printBPM(BPM);
    
    stroke(0, 61.0f, 0);
    strokeWeight(lineSize / 2);
    stroke(0, 61.0f, 0);
    line(width / 2.0f, h, widthEnd, h);
    
    textAlign(RIGHT, CENTER);
    textSize(map(10.0f, 0, finalx + finaly, 0, width + height));
    text(rangeNum + "-", width / 2.0f, h);
    
    for (float i = 0; i < 6.0f; i+=1.0f)
    {
      line(width / 2.0f, h - (ten * i), widthEnd, h - (ten * i));
      text(rangeNum + "-", width / 2.0f, h - (ten * i));
      line(width / 2.0f, h + (ten * i), widthEnd, h + (ten * i));
      text(rangeNum + "-", width / 2.0f, h + (ten * i));
      rangeNum += 30;
    }//end for
    
    line(width / 2.0f, h - (ten * 5.0f), width / 2.0f, h + (ten * 5.0f));
    line(widthEnd, h - (ten * 5.0f), widthEnd, h + (ten * 5.0f));
  }//end METHOD drawGraph()
  
  /*
    Draws line that will act as a heart rate monitor
  */
  
  void heartRate()
  {
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
      line(graphCount, h - coY.get(coY.size() - 2), graphCount + speed, h - coY.get(coY.size() - 1));
    }//end else
    else if (graphCount >= majorDiv && graphCount < centreSpike && index2 + 1 < bigCoY.size())
    {
      line(graphCount, h - bigCoY.get(index2), graphCount + speed, h - bigCoY.get(index2 + 1));
      index2++;
    }//end if
    else if (graphCount > centreSpike && index2 - 1 > -1)
    {
      line(graphCount, h - bigCoY.get(index2), graphCount + speed, h - bigCoY.get(index2 - 1));
      index2--;
    }
    else if (graphCount >= centreSpike - speed && graphCount <= centreSpike + speed)
    {
      line(graphCount, h - bigCoY.get(bigCoY.size() - 2), graphCount + speed, h - bigCoY.get(bigCoY.size() - 1));
    }//end else
    else
    {
      line(graphCount, h, graphCount + speed, h);
    }
    
    if ((graphCount + speed * 3.0f) > widthEnd)
    {
      graphCount = widthHalf;
      setupRate();
      drawGraph();
    }//end if
  }//end heartRate()
  
  void printBPM(int BPM)
  {
    fill(green);
    stroke(green);
    textAlign(RIGHT, CENTER);
    textSize(map(70, 0, finaly, 0, height));
    text("BPM", widthHalf - map(40, 0, finalx, 0, width), h - (diff / 5.0f) * 2.0f);
    text(BPM, widthHalf - map(40, 0, finalx, 0, width), h + (diff / 5.0f) * 2.0f);
  }//end printBPM
  
  void changeBPM()
  {
    healthAverage = (healthAverage + (int)random(70, 120)) / 2;
    index = 0;
    index2 = 0;
    setupRate();
  }//end changeBPM
}//end CLASS Health