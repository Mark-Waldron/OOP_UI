class Home
{
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
    
    noStroke();
    fill(#006600);
    arc(width * .85, height * .75f, diameter, diameter, (TWO_PI / 360.0f) * count, (TWO_PI / 360.0f) * count + PI / 4.0f);
    count++;
  }//end radar
}//end class