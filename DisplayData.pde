class DisplayData
{
  float w1;
  float w2;
  float widthDiv;
  float h1;
  float h2;
  float heightDiv;
  
  float leftBorder;
  float heightBorder;
  
  float leftBorderX; 
  float rightBorderX;
  
  float topBorderY; 
  float bottomBorderY; 
  
  void loadGraphData()
  {
    float borderX = map(50, 0, finalx, 0, width);
    float borderY = map(50, 0, finaly, 0, height);
    
    this.w1 = map(24.5f, 0, finalx, 0, width);
    this.w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    this.widthDiv = (w1 + w2) / 2.0f;
    this.h1 = map(122.0f, 0, finaly, 0, height);
    this.h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    this.heightDiv = (h1 + h2) / 2.0f;
    
    this.leftBorderX = w1 + borderX;
    this.rightBorderX = w2 - borderX;
    
    this.topBorderY = h1 + borderY;
    this.bottomBorderY = h2 - borderY;
    
    stroke(green);
    
    line(leftBorderX, topBorderY, leftBorderX, bottomBorderY);
    line(rightBorderX, topBorderY, rightBorderX, bottomBorderY);
    line(leftBorderX, bottomBorderY, rightBorderX, bottomBorderY);
    line(leftBorderX, topBorderY, rightBorderX, topBorderY);
  }//endloadGraphData
  
  void Health()
  {
    textAlign(CENTER);
    fill(green);
    text("Health", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Health, 0, 100, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Health, 0, 100, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
    }//end for
  }//end Health
  
  void Engine()
  {
    textAlign(CENTER);
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
    }//end for
  }//end Engine
  
  void Fuel()
  {
    textAlign(CENTER);
    fill(green);
    text("Fuel", widthDiv, topBorderY - map(10, 0, finaly, 0, height));
    
    stroke(green);
    for (int i = 1 ; i < data.size() ; i ++)
    {
      stroke(green);
      float x1 = map(i - 1, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y1 = map(data.get(i - 1).Temp, 0, 100, bottomBorderY, topBorderY);
      float x2 = map(i, 0, data.size() - 1, leftBorderX, rightBorderX);
      float y2 = map(data.get(i).Temp, 0, 100, bottomBorderY, topBorderY);
      line(x1, y1, x2, y2);
    }//end for
  }//end Fuel
  
  void Shields()
  {
    textAlign(CENTER);
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
    }//end for
  }//end Shields
  
  void Oxygen()
  {
    textAlign(CENTER);
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
    }//end for
  }//end Shields
  
  void Reactor()
  {
    textAlign(CENTER);
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
    }//end for
  }//end Shields
}//end CLASS DisplayData