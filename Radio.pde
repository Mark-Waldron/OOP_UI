class Radio
{
  /*
    A method that will display a menu with options as to what song a user would like to play
  */
  
  void test()
  {
    float jkf_X = map((finalx / 4.0f) * 3.0f - 50.0f, 0, finalx, 0, width);
    float alter = map(width / 6.0f, 0 ,width, 24.5f, width - 24.5f);
    float w1 = map(24.5f, 0, finalx, 0, width);
    float w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    float widthDiv = (w1 + w2) / 2.0f;
    float h1 = map(122.0f, 0, finaly, 0, height);
    float h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    float heightDiv = (h1 + h2) / 2.0f;
    float panelDiff = map(10.0f, 0, finaly, 0, height);
    float gap = map(30, 0, finaly, 0, height);
    float tSize = map(25.0f, 0, finalx + finaly, 0, width + height);
    
    tint(#006600);
    image(jfk, jkf_X, (height / 2.0f - (jfkHeight / 2.0f) / 2.0f) + map(22, 0, finaly, 0, height), jfkWidth / 2.0f, jfkHeight / 2.0f);
    
    textSize(tSize);
    stroke(#006600);
    strokeWeight(lineSize);
    fill(0);
    line(alter, (heightDiv - panelDiff) - (gap * 4.0f), alter, (heightDiv - panelDiff));
    line(w1, heightDiv, w2, heightDiv);
    line(widthDiv, (heightDiv - panelDiff), widthDiv, (heightDiv - panelDiff) - (gap * 4.0f));
    
    for (float i = 1; i < 5.0f; i+=1.0f)
    {
      fill(0);
      rect(alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
      fill(#006600);
      textAlign(LEFT, CENTER);
      text("ergsdgrfsdf", alter, (heightDiv - panelDiff) - (gap * i), widthDiv - alter, gap);
      //line(alter, (heightDiv - panelDiff) - (gap * i), widthHalf, (heightDiv - panelDiff) - (gap * i));
    }//end for
  }//end test
}//end CLASS Radio