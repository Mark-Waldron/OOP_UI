class Health
{
  /*
    Method to draw the heart rate monitor's backrgound
  */
  
  void drawGraph()
  {
    float ten = map(15.0f, 0, finalx + finaly, 0, width + height);
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
    float diff = map(15.0f, 0, finalx + finaly, 0, width + height) * 5.0f;
    float speed = map(1.0f, 0, finalx, 0, width);
    
    stroke(#006600);
    strokeWeight(2.0f);
    
    line ((x1 + speed) + (graphCount), h, (x1 + speed) + (speed + graphCount), h);
    graphCount += speed;
    
    if ((graphCount + speed * 2.0f) > map(592.5f, 0, finalx, 0, width) - x1)
    {
      graphCount = 0.0f;
      fill(0);
      stroke(0);
      rect(x1, h - diff, widthEnd - x1, diff * 2.0f);
      drawGraph();
      //defaultSetup();
    }
  }//end heartRate()
}//end CLASS Health