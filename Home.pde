class Home
{
  /*
    A method that will draw the home's radar screen with use of the 
    arc function
  */
  
  float w1;
  float w2;
  float widthDiv;
  float h1;
  float h2;
  float heightDiv;
  
  void setUp()
  {
    this.w1 = map(24.5f, 0, finalx, 0, width);
    this.w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    this.widthDiv = (w1 + w2) / 2.0f;
    this.h1 = map(122.0f, 0, finaly, 0, height);
    this.h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    this.heightDiv = (h1 + h2) / 2.0f;
  }//end statusSetup()
  
  void radar()
  {
    float diameter = map(130.0f, 0, finalx + finaly, 0, width + height);
    double distance = 22000000;
    noStroke();
    fill(0);
    strokeWeight(lineSize);
    
    ellipse(width * .85, height * .75f, diameter, diameter);
    
    diameter -= map(10.0f, 0, finalx + finaly, 0, width + height);
    
    stroke(green);
    ellipse(width * .85, height * .75f, diameter, diameter);
    
    //Radar draw
    noStroke();
    fill(green);
    arc(width * .85, height * .75f, diameter, diameter, (TWO_PI / 360.0f) * count, (TWO_PI / 360.0f) * count + PI / 4.0f);
    //text(String.format("%.1f", distance), (w2 - w1) / 4.0f, (h2 - h1) / 2.0f);
    count++;
    
    //Ensures the radar counter is rest
    //to prevent any overflow
    if (count > 360)
    {
      count = 0.0f;
    }//end if
  }//end radar
}//end class