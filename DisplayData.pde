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
    line(leftBorderX, heightDiv, rightBorderX, heightDiv);
    line(widthDiv, topBorderY, widthDiv, bottomBorderY);
  }//endloadGraphData
}//end CLASS DisplayData