class Main_Menu
{
  void mainOptions()
  {
    textFont(mono);
    String choices[] = {"JACK", "HEAL", "HOME", "SHIP","LOGS"};
    float text_sizes[] = {30.0f, 30.0f, 30.0f, 30.0f, 30.0f};
    float divide = (width * 0.42f + ((width / 15.0f) - map(50, 0, finalx, 0, width))) / 4.0f;
    float diff = map(35, 0, finaly, 0, height);
    float h = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    float menu_div = ((width * 0.58f + divide * 2.0f) - (width * 0.42f - divide * 2.0f)) / 5;
    float reset = (width * 0.58f + divide * 2.0f) - (width * 0.42f - divide * 2.0f) - map(1.5f, 0, finalx, 0, width);
    float gap = (width * 0.42f - divide * 2.0f);
    
    noStroke();
    fill(0);
    //rect(gap + map(1, 0, finalx, 0, width), h + map(1, 0, finalx, 0, width), reset, diff - map(1.2f, 0, finaly, 0, height));
    //line(width * 0.58f + divide * 2.0f, h + diff, width * 0.42f - divide * 2.0f, h + diff);
    textAlign(CENTER);
    
    
    for (int i = 1; i < 5; i++)
    {
      float x1 = gap + menu_div * (float)i;
      
      fill(#006600);
      line(x1, h, x1, h + diff);
    }//end for
    
    fill(#006600);
    
    rect(gap + map(1, 0, finalx, 0, width) + menu_div * keyCount, h + map(1.4f, 0, finaly, 0, height), menu_div - map(1.5, 0, finalx, 0, width), diff - map(1.5f, 0, finaly, 0, height));
    
    for (int i = 0; i < 5; i++)
    {
      float x1 = gap + menu_div * (float)i;
      float x2 = x1 + menu_div / 2.0f;
      float y = (h + diff) - map(7, 0, finaly, 0, height);
      
      if (i == keyCount)
      {
        fill(0);
      }
      else
      {
        fill(#006600);
      }//end if
      
      textSize(map(text_sizes[i], 0, finalx, 0, width));
      text(choices[i], x2, y);
      //text(str, x, y1, x2, y2)
    }//end for
  }//end void
}//end CLASS Menu