class Home
{
  /*
    A method that will draw the home's radar screen with use of the 
    arc function
  */
  void radar()
  {
    float diameter = map(130.0f, 0, finalx + finaly, 0, width + height);
    
    noStroke();
    fill(0);
    strokeWeight(2.0f);
    
    ellipse(width * .85, height * .75f, diameter, diameter);
    
    diameter -= 10.0f;
    
    stroke(#006600);
    ellipse(width * .85, height * .75f, diameter, diameter);
    
    //Radar draw
    noStroke();
    fill(#006600);
    arc(width * .85, height * .75f, diameter, diameter, (TWO_PI / 360.0f) * count, (TWO_PI / 360.0f) * count + PI / 4.0f);
    count++;
    
    //Ensures the radar counter is rest
    //to prevent any overflow
    if (count > 360)
    {
      count = 0.0f;
    }//end if
  }//end radar
}//end class