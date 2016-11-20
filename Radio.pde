class Radio
{
  float jfk_X;
  float jfk_Y;
  
  float w1;
  float w2;
  float widthDiv;
  
  float h1;
  float h2;
  float heightDiv;
  
  float alter;
  
  float panelDiff;
  float gap;
  float tSize;
  
  float graphHeight;
  float graphWidth;
  
  float graphHeightDiv;
  
  float period;
  
  float dx;
  float sinY[];
  
  /*
    A method that will display a menu with options as to what song a user would like to play
  */
   
  void test()
  {
    this.jfk_X = map((finalx / 4.0f) * 3.0f - 50.0f, 0, finalx, 0, width);
    this.jfk_Y = (height / 2.0f - (jfkHeight / 2.0f) / 2.0f) + map(22, 0, finaly, 0, height);
    this.w1 = map(24.5f, 0, finalx, 0, width);
    this.w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    this.widthDiv = (w1 + w2) / 2.0f;
    this.h1 = map(122.0f, 0, finaly, 0, height);
    this.h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    this.heightDiv = (h1 + h2) / 2.0f;
    this.alter = map(width / 6.0f, 0, width, 24.5f, width - 24.5f);
    this.panelDiff = map(10.0f, 0, finaly, 0, height);
    this.gap = map(30, 0, finaly, 0, height);
    this.tSize = map(25.0f, 0, finalx + finaly, 0, width + height);
    this.graphHeight = map(100, 0, finaly, 0, height);
    this.graphHeightDiv = (heightDiv + panelDiff) + (graphHeight / 2.0f);
    this.graphWidth = (widthDiv - alter);
    this.period = map(finalx / 4.0f, 0, finalx, alter, widthDiv);
    this.dx = (TWO_PI / period);
    this.sinY = new float[(int)graphWidth];
    
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
    //line(w1, heightDiv, w2, heightDiv);
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
    }//end fr
    
    noFill();
    stroke(#006600);

    //line(alter, graphHeightDiv, widthDiv, graphHeightDiv);
    rect(alter, (heightDiv + panelDiff), widthDiv - alter, graphHeight);
    if (play == true)
    {
      sinWave();
    }//end if
  }//end test
  
  void sinWave()
  {
    float amplitude = map(random(0, finaly), 0, finaly, 0, graphHeightDiv - (heightDiv + panelDiff));
    // For every x value, calculate a y value with sine function
    float x = theta;
    
    for (int i = 0; i < sinY.length; i++)
    {
      sinY[i] = sin(x)*amplitude;
      x += dx;
      point(alter + i + 1.0f, graphHeightDiv + sinY[i]);
    }//end for
    
    theta += 0.02;
    if (theta > 360)
    {
      theta = 0.0f;
    }
  }//end sinWave
}//end RADIO CLASS