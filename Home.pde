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
    color black = 0;
    float index = 0;
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
    pushMatrix();
    
    translate(width * .85, height * .75f);
    rotate(count);
    
    for(float i = TWO_PI / 4.0f; i >= 0; i -= ((TWO_PI / 4.0f) / 100.0f))
    {
      color x = lerpColor(green, black, index);
      fill(x);
      arc(0.0f, 0.0f, diameter, diameter, count + i - ((TWO_PI / 4.0f) / 90.0f), count + i);
      index += .01;
    }//end for
    //text(String.format("%.1f", distance), (w2 - w1) / 4.0f, (h2 - h1) / 2.0f);
    
    popMatrix();
    
    count += TWO_PI / 360.0f;
    
    //Ensures the radar counter is rest
    //to prevent any overflow
    if (count > TWO_PI)
    {
      count = 0.0f;
    }//end if
  }//end radar
}//end class