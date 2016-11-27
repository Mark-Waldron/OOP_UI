/*
  CLASS IS NEVER USED WITH THE PROGRAM. 
*/

class Icons
{
  void radioDraw()
  {
    fill(green);
    float sLength = 50.0f;
    float angleLine = (sLength * sin(PI / 4.0f));
    noStroke();

    fill(green);
    
    line(0,0,50, (sLength * sin(PI / 4.0f)));
    radio = createShape();
    radio.beginShape();
    radio.vertex(0, 0);
    radio.vertex(sLength , 0);
    
    radio.vertex(sLength + (sLength * cos(PI / 4.0f)), -angleLine);
    
    radio.vertex(sLength + (sLength * cos(PI / 4.0f))
    , -angleLine + (sLength + (angleLine * 2.0f)));
    
    radio.vertex(sLength, sLength);
    radio.vertex(0, sLength);
    radio.scale(map(1, 0, finalx + finaly, 0, width + height));
    radio.endShape(CLOSE);
  }//end radio()
}//end CLASS Icons