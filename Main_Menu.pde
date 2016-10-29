class Main_Menu
{
  void mainOptions()
  {
    textFont(mono);
    String choices[] = {"Jack", "Heal", "Home", "Ship","Logs"};
    float text_sizes[] = {35.0f, 35.0f, 35.0f, 35.0, 35.0};
    float divide = (width * 0.42f + ((width / 15.0f) - map(50, 0, finalx, 0, width))) / 4.0f;
    float diff = map(35, 0, finaly, 0, height);
    float h = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    float menu_div = ((width * 0.58f + divide * 2.0f) - (width * 0.42f - divide * 2.0f)) / 5;
    
    float topx = map(702, 0, finalx, 0, width);
    float topy = map(80, 0, finaly, 0, height);
    
    fill(0);
    
    arc(width / 2.0f, height * 0.163, topx, topy, (PI / 180.0f) * 51.7f, (PI / 180.0f) * 128.3);
    line(width * 0.58f + divide * 2.0f, h, width * 0.58f + divide * 2.0f, h + diff);
    line(width * 0.42f - divide * 2.0f, h, width * 0.42f - divide * 2.0f, h + diff);
    
    //line(width * 0.58f + divide * 2.0f, h + diff, width * 0.42f - divide * 2.0f, h + diff);
    textAlign(CENTER);
    
    /*
    for (int i = 1; i < 5; i++)
    {
      float x1 = (width * 0.42f - divide * 2.0f) + menu_div * (float)i;
      
      fill(#006600);
      line(x1, h, x1, h + diff);
    }//end for
    */
    
    for (int i = 0; i < 5; i++)
    {
      float x1 = (width * 0.42f - divide * 2.0f) + menu_div * (float)i;
      float x2 = x1 + menu_div / 2.0f;
      float y = (h + diff) - map(6, 0, finaly, 0, height);
     
      fill(#006600);
      textSize(map(text_sizes[i], 0, finalx, 0, width));
      text(choices[i], x2, y);
      //text(str, x, y1, x2, y2)
    }//end for
  }//end void
}//end CLASS Menu