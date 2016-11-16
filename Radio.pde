class Radio
{
  /*
    A method that will display a menu with options as to what song a user would like to play
  */
  
  /*
  float w1 = map(24.5f, 0, finalx, 0, width);
  float w2 = map(finalx - 24.5f, 0, finalx, 0, width);
  float widthDiv = (w1 + w2) / 2.0f;
  float h1 = map(122.0f, 0, finaly, 0, height);
  float h2 = map(finaly - 25.0f, 0, finaly, 0, height);
  float heightDiv = (h1 + h2) / 2.0f;
  float alter = map(width / 6.0f, 0 ,width, 24.5f, width - 24.5f);
  float panelDiff = map(10.0f, 0, finaly, 0, height);
  float gap = map(30, 0, finaly, 0, height);
  */
  
  void test()
  {
    float jfk_X = map((finalx / 4.0f) * 3.0f - 50.0f, 0, finalx, 0, width);
    float jfk_Y = (height / 2.0f - (jfkHeight / 2.0f) / 2.0f) + map(22, 0, finaly, 0, height);
    float w1 = map(24.5f, 0, finalx, 0, width);
    float w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    float widthDiv = (w1 + w2) / 2.0f;
    float h1 = map(122.0f, 0, finaly, 0, height);
    float h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    float heightDiv = (h1 + h2) / 2.0f;
    float alter = map(width / 6.0f, 0 ,width, 24.5f, width - 24.5f);
    float panelDiff = map(10.0f, 0, finaly, 0, height);
    float gap = map(30, 0, finaly, 0, height);
    float tSize = map(25.0f, 0, finalx + finaly, 0, width + height);
    
    //Border for JFK frame
    float border_x = map(15.0f, 0, finalx, 0, width);
    float border_y = map(15.0f, 0, finaly, 0, height);
    
    //Loading of JFK image
    tint(#006600);
    image(jfk, jfk_X, jfk_Y, jfkWidth / 2.0f, jfkHeight / 2.0f);
    
    stroke(#006600);
    noFill();
    
    line(jfk_X - border_x, jfk_Y - border_y, jfk_X - border_x, jfk_Y + (jfkHeight / 2.0f));
    line(jfk_X - border_x, jfk_Y + (jfkHeight / 2.0f), jfk_X + (jfkWidth / 2.0f), jfk_Y + (jfkHeight / 2.0f));
    line(jfk_X - border_x, jfk_Y - border_y, jfk_X + (jfkWidth / 2.0f), jfk_Y - border_y);
    line(jfk_X + (jfkWidth / 2.0f), jfk_Y - border_y, jfk_X + (jfkWidth / 2.0f), jfk_Y + (jfkHeight / 2.0f));
    
    textSize(tSize);
    stroke(#006600);
    strokeWeight(lineSize);
    fill(0);
    //line(alter, (heightDiv - panelDiff) - (gap * 4.0f), alter, (heightDiv - panelDiff));
    line(w1, heightDiv, w2, heightDiv);
    //line(widthDiv, (heightDiv - panelDiff), widthDiv, (heightDiv - panelDiff) - (gap * 4.0f));
    
    noStroke();
    for (float i = 1; i < 5.0f; i+=1.0f)
    {
      String song = files[((int)i - 1)].substring(0, files[((int)i - 1)].length() - 4);
      
      if (radioToggle == (i - 1))
      {
        fill(#006600);
        rect(alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
        fill(0);
        textAlign(LEFT, CENTER);
        text(song, alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
      }//end if
      else
      {
        fill(0);
        rect(alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
        fill(#006600);
        textAlign(LEFT, CENTER);
        text(song, alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
      }//end else
      //stroke(#006600);
      //line(alter, (heightDiv - panelDiff) - (gap * i), widthHalf, (heightDiv - panelDiff) - (gap * i));
    }//end for
    
    waves();
  }//end test
  
  void waves()
  {
    float jfk_X = map((finalx / 4.0f) * 3.0f - 50.0f, 0, finalx, 0, width);
    float jfk_Y = (height / 2.0f - (jfkHeight / 2.0f) / 2.0f) + map(22, 0, finaly, 0, height);
    float w1 = map(24.5f, 0, finalx, 0, width);
    float w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    float widthDiv = (w1 + w2) / 2.0f;
    float h1 = map(122.0f, 0, finaly, 0, height);
    float h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    float heightDiv = (h1 + h2) / 2.0f;
    float alter = map(width / 6.0f, 0 ,width, 24.5f, width - 24.5f);
    float panelDiff = map(10.0f, 0, finaly, 0, height);
    
    noFill();
    stroke(#006600);
    
    float y = map(finaly / 2.0f, 0, finaly, (heightDiv + panelDiff), (heightDiv + panelDiff) + 100);
    line(alter, y, widthDiv, y);
    rect(alter, (heightDiv + panelDiff), widthDiv - alter, 100);
  }//end waves()
}//end CLASS Radio