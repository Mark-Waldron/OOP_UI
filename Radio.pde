class Radio
{
  //Image locations
  float jfk_X;
  float jfk_Y;
  
  //Width and height of scope
  float w1;
  float w2;
  float widthDiv;
  
  float h1;
  float h2;
  float heightDiv;
  
  //Left side of the menu and panel
  float alter;
  
  //Differences for the printing of song names
  float panelDiff;
  float gap;
  
  //Text size
  float tSize;
  
  //Graph width and height size
  float graphHeight;
  float graphWidth;
  
  //Half the graph height
  float graphHeightDiv;
  
  //Varaibles for sin wave
  float period;
  float dx;
  float sinY[];
  
  float amplitude;
  float x;
  
  /*
    A method that will display a menu with options as to what song a user would like to play
  */
   
  void test()
  {
    //Initising of variables local to the class
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
    this.period = map(125.0f, 0, finalx, 0, widthDiv - alter);
    this.dx = (TWO_PI / period);
    this.sinY = new float[(int)graphWidth];
    
    //Border for JFK frame
    float border_x = map(15.0f, 0, finalx, 0, width);
    float border_y = map(15.0f, 0, finaly, 0, height);

    //Loading of JFK image
    tint(#006600);
    image(jfk, jfk_X, jfk_Y, jfkWidth / 2.0f, jfkHeight / 2.0f);

    stroke(green);
    noFill();
    
    //Drawing of JFK border frame
    line(jfk_X - border_x, jfk_Y - border_y, jfk_X - border_x, jfk_Y + (jfkHeight / 2.0f));
    line(jfk_X - border_x, jfk_Y + (jfkHeight / 2.0f), jfk_X + (jfkWidth / 2.0f), jfk_Y + (jfkHeight / 2.0f));
    line(jfk_X - border_x, jfk_Y - border_y, jfk_X + (jfkWidth / 2.0f), jfk_Y - border_y);
    line(jfk_X + (jfkWidth / 2.0f), jfk_Y - border_y, jfk_X + (jfkWidth / 2.0f), jfk_Y + (jfkHeight / 2.0f));

    textSize(tSize);
    strokeWeight(lineSize);
    fill(0);
    //line(alter, (heightDiv - panelDiff) - (gap * 4.0f), alter, (heightDiv - panelDiff));
    //line(w1, heightDiv, w2, heightDiv);
    //line(widthDiv, (heightDiv - panelDiff), widthDiv, (heightDiv - panelDiff) - (gap * 4.0f));

    //Drawing of radio menu
    noStroke();
    for (float i = 1; i < 5.0f; i+=1.0f)
    {
      String song = files[((int)i - 1)].substring(0, files[((int)i - 1)].length() - 4);
      
      //Check if the option is hovered
      if (radioToggle == (i - 1))
      {
        fill(green);
        rect(alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
        fill(0);
        textAlign(LEFT, CENTER);
        text(song, alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
      }//end if
      else
      {
        fill(0);
        rect(alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
        fill(green);
        textAlign(LEFT, CENTER);
        text(song, alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
      }//end else
      //stroke(#006600);
      //line(alter, (heightDiv - panelDiff) - (gap * i), widthHalf, (heightDiv - panelDiff) - (gap * i));
    }//end fr
    
    //Drawing of the select
    noFill();
    stroke(green);

    //line(alter, graphHeightDiv, widthDiv, graphHeightDiv);
    rect(alter, (heightDiv + panelDiff), widthDiv - alter, graphHeight);
    
    //Call to draw Sin Wave
    if (play == true)
    {
      wave();
    }//end if
  }//end test
  
  void wave()
  {
    //Changes amp vales twice every second
    if (frameCount % 10 == 0)
    {
      this.amplitude = map(random(finaly/4.0f, finaly), 0, finaly, 0, graphHeightDiv - (heightDiv + panelDiff));
      // For every x value, calculate a y value with sine function
    }//end if
    
    x = theta;
    /*
      Calculation to draw the cos wave and the values it shall plot
    */
    for (int i = 0; i < sinY.length; i++)
    {
      sinY[i] = cos(x)*amplitude;
      x += dx;
      point(alter + i + 1.0f, graphHeightDiv + sinY[i]);
    }//end for
    
    //Check to ensure no overload occurs
    if (theta > 360)
    {
      theta = 0.0f;
    }//end if
  }//end sinWave
}//end RADIO CLASS