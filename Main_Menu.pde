class Main_Menu
{
  /*
    A method that will display the menu options on screen
    and will track the users choice
  */
  
  void mainOptions()
  {
    //Method declarations
    String choices[] = {"JACK", "HEAL", "HOME", "SHIP","DATA"};
    float text_sizes[] = {30.0f, 30.0f, 30.0f, 30.0f, 30.0f};
    float divide = (width * 0.42f + ((width / 15.0f) - map(50, 0, finalx, 0, width))) / 4.0f;
    float diff = map(35, 0, finaly, 0, height);
    float h = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    float menu_div = ((width * 0.58f + divide * 2.0f) - (width * 0.42f - divide * 2.0f)) / 5;
    float reset = (width * 0.58f + divide * 2.0f) - (width * 0.42f - divide * 2.0f) - map(1.5f, 0, finalx, 0, width);
    float gap = (width * 0.42f - divide * 2.0f);
    float y = (h + diff) - map(7, 0, finaly, 0, height);
    
    //Setup to draw menu background
    textFont(mono);
    noStroke();
    fill(0);
    rect(gap + map(1, 0, finalx, 0, width), h + map(1, 0, finalx, 0, width), reset, diff - map(1.2f, 0, finaly, 0, height));
    //line(width * 0.58f + divide * 2.0f, h + diff, width * 0.42f - divide * 2.0f, h + diff);
    textAlign(CENTER);
    
    /*
    //Loop to draw partition between each menu option
    for (int i = 1; i < 5; i++)
    {
      float x1 = gap + menu_div * (float)i;
      
      fill(#006600);
      line(x1, h, x1, h + diff);
    }//end for
    */
    
    fill(green);
    
    //Hover icon
    rect(gap + map(1, 0, finalx, 0, width) + menu_div * keyCount, h + map(1.4f, 0, finaly, 0, height)
    , menu_div - map(1.9f, 0, finalx, 0, width), diff - map(1.5f, 0, finaly, 0, height));
    
    //For loop to display menu options
    for (int i = 0; i < 5; i++)
    {
      float x1 = gap + menu_div * (float)i;
      float x2 = x1 + menu_div / 2.0f;
      
      //Higlights current page
      if (i == keyEntered)
      {
        noFill();
        strokeWeight(1.0f);
        stroke(green);
        rect(gap + map(2, 0, finalx, 0, width) + menu_div * keyEntered, h + map(2.4f, 0, finaly, 0, height)
        , menu_div - map(3.8f, 0, finalx, 0, width), diff - map(2.5f, 0, finaly, 0, height));
      }//end if
      
      //Changes the font colour of text if hovered
      if (i == keyCount)
      {
        noStroke();
        fill(0);
      }
      else
      {
        noStroke();
        fill(green);
      }//end if
      
      textSize(map(text_sizes[i], 0, finalx, 0, width));
      text(choices[i], x2, y);
      //shape(radio, x2, y);
    }//end for
  }//end void
}//end CLASS Menu