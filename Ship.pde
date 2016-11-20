class Ship
{
  void statusSetup()
  {
    float h1 = map(122.0f, 0, finaly, 0, height);
    float h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    float heightDiv = (h1 + h2) / 2.0f;
    
    strokeWeight(2.0f);
    noStroke();
    
    float diameter = map(200.0f, 0, finalx + finaly, 0, width + height);
    
    fill(255);
    arc(width / 2.0f, heightDiv, 270, 270, -PI/2.0f, (-PI/2.0f) + (TWO_PI / 3.0f));
    arc(width / 2.0f, heightDiv, 250, 250, (-PI/2.0f) + (TWO_PI / 3.0f), (-PI/2.0f) + (TWO_PI / 3.0f) * 2.0f);
    arc(width / 2.0f, heightDiv, 230, 230, (-PI/2.0f) + (TWO_PI / 3.0f), (-PI/2.0f) + (TWO_PI / 3.0f) * 3.0f);
    
    fill(#006600);
    ellipse(width / 2.0f, heightDiv, diameter, diameter);
  }//end statusSetup()
}//end CLASS Ship