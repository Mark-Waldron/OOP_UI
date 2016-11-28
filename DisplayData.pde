class DisplayData extends Dimension
{ 
  //Attributes
  float leftBorder;
  float heightBorder;
  
  float leftBorderX; 
  float rightBorderX;
  
  float topBorderY; 
  float bottomBorderY; 
  
  //Loads all data for the graph and draws the frame
  void loadGraphData()
  {
    float borderX = map(50, 0, finalx, 0, width);
    float borderY = map(50, 0, finaly, 0, height);
    
    //Call to superclass method
    super.setUp();
    
    this.leftBorderX = w1 + borderX;
    this.rightBorderX = w2 - borderX;
    
    this.topBorderY = h1 + borderY;
    this.bottomBorderY = h2 - borderY;
    
    stroke(green);
    
    //Drawing of frame
    line(leftBorderX, topBorderY, leftBorderX, bottomBorderY);
    line(rightBorderX, topBorderY, rightBorderX, bottomBorderY);
    line(leftBorderX, bottomBorderY, rightBorderX, bottomBorderY);
    line(leftBorderX, topBorderY, rightBorderX, topBorderY);
    
    textSize(map(20, 0, finalx + finaly, 0, width + height));
    fill(green);
    textAlign(RIGHT, CENTER);
    
    //Drawing of values against the frame
    for (float i = 0.0; i <= 10.0f; i += 1.0f)
    {
      text((int)i + "-",leftBorderX - map(2.0f, 0, finalx, 0, width), bottomBorderY - (((bottomBorderY - topBorderY) / 10.0f) * i));
    }//end for
    
    //Printing of navigation information
    textAlign(CENTER, TOP);
    textSize(map(25, 0, finalx + finaly, 0, width + height));
    text("UP and DOWN keys to navigate", widthDiv, bottomBorderY + map(5, 0, finaly, 0, height));
  }//endloadGraphData
  
  void Health()
  {
    textAlign(CENTER);
    textSize(map(30, 0, finalx + finaly, 0, width + height));
    fill(green);
    text("Health", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Health, 0, 150, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Health, 0, 150, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
      
      if (i < (data.size() - 1))
      {
        float map = map(2, 0, finalx + finaly, 0, width + height);
        noStroke();
        stroke(green);
        ellipse(x2, y2, map, map);
      }//end if
    }//end for
  }//end Health
  
  void Engine()
  {
    textAlign(CENTER);
    textSize(map(30, 0, finalx + finaly, 0, width + height));
    fill(green);
    text("Engine", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      stroke(green);
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Engine, 0, 100, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Engine, 0, 100, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
      
      if (i < (data.size() - 1))
      {
        float map = map(2, 0, finalx + finaly, 0, width + height);
        noStroke();
        stroke(green);
        ellipse(x2, y2, map, map);
      }//end if
    }//end for
  }//end Engine
  
  void Fuel()
  {
    textAlign(CENTER);
    textSize(map(30, 0, finalx + finaly, 0, width + height));
    fill(green);
    text("Temperature", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      stroke(green);
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Temp, 0, 100, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Temp, 0, 100, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
      
      if (i < (data.size() - 1))
      {
        float map = map(2, 0, finalx + finaly, 0, width + height);
        noStroke();
        stroke(green);
        ellipse(x2, y2, map, map);
      }//end if
    }//end for
  }//end Fuel
  
  void Shields()
  {
    textAlign(CENTER);
    textSize(map(30, 0, finalx + finaly, 0, width + height));
    fill(green);
    text("Shields", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      stroke(green);
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Shields, 0, 100, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Shields, 0, 100, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
      
      if (i < (data.size() - 1))
      {
        float map = map(2, 0, finalx + finaly, 0, width + height);
        noStroke();
        stroke(green);
        ellipse(x2, y2, map, map);
      }//end if
    }//end for
  }//end Shields
  
  void Oxygen()
  {
    textAlign(CENTER);
    textSize(map(30, 0, finalx + finaly, 0, width + height));
    fill(green);
    text("Oxygen", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      stroke(green);
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Oxygen, 0, 100, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Oxygen, 0, 100, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
      
      if (i < (data.size() - 1))
      {
        float map = map(2, 0, finalx + finaly, 0, width + height);
        noStroke();
        stroke(green);
        ellipse(x2, y2, map, map);
      }//end if
    }//end for
  }//end Shields
  
  void Reactor()
  {
    textAlign(CENTER);
    textSize(map(30, 0, finalx + finaly, 0, width + height));
    fill(green);
    text("Reactor", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      stroke(green);
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Reactor, 0, 100, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Reactor, 0, 100, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
      
      if (i < (data.size() - 1))
      {
        float map = map(2, 0, finalx + finaly, 0, width + height);
        noStroke();
        stroke(green);
        ellipse(x2, y2, map, map);
      }//end if
    }//end for
  }//end Shields
}//end CLASS DisplayData