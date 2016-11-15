class Screen
{
  //A method to draw screen defaults
  void screenDraw()
  {
    float topx = map(702, 0, finalx, 0, width);
    float topy = map(80, 0, finaly, 0, height);
    float bottomx = map(50, 0, finalx, 0, width);
    float bottomy = map(400, 0, finaly, 0, height);
    float rectx = map(47, 0, finalx, 0, width);
    float rectw = map(656, 0, finalx, 0, width);
    float recty = map(51, 0, finaly, 0, height);
    float recth = map(398, 0, finaly, 0, height);
    
    noStroke();
    fill(0);
    rect(rectx, recty, rectw, recth);//702 448
    
    strokeWeight(lineSize);
    stroke(#006600);
    
    //Top + bottom arc
    arc(width / 2.0f, height * 0.13, topx, topy, (PI / 180.0f) * 200.5f, (TWO_PI / 360.0f) * 339.5f);
    arc(width / 2.0f, height * 0.87, topx, topy, (PI / 180.0f) * 20.5f, (PI / 180.0f) * 159.5f);
    
    //Arc left + right
    arc((width / 15.0f), height / 2.0f, bottomx, bottomy, (HALF_PI / 90.0f) * 95.0f, (HALF_PI / 90.0f) * 265.0f);
    arc((width / 15.0f) * 14.0f, height / 2.0f, bottomx, bottomy, (HALF_PI / 90.0f) * 275.0f, ((TWO_PI + HALF_PI) / 450.0f) * 445.0f);
    
    line (width * 0.42, (height / 500.0f) * 26.0f, width * 0.42, height * 0.14);
    line (width * 0.58, (height / 500.0f) * 26.0f, width * 0.58, height * 0.14);
  }//end screenDraw()
}//end CLASS Screen