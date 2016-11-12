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
  float angle = 0.0f;
  float angle2 = 0.0f;
  float BPM = (random(60, 120.0f));
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
    float angleHeight = map(BPM, 0, 150.0f, h, h + diff);
    
    float at = atan(angleHeight/(spikeRange - minor));
    
    stroke(#006600);
    strokeWeight(1.0f);
    
    line(0, angleHeight, width, angleHeight);
    
    //strokeWeight(2.0f);
    graphCount += speed;
    
    if ((graphCount + speed * 2.0f) > widthEnd)
    {
      graphCount = widthHalf;
    }//end if
    
  }//end heartRate()
}//end CLASS Health