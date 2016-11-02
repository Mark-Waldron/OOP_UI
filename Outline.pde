class Outline
{
  void hudOutline()
  {
    float divide_w = width * 0.105;
    float hud1 = height * 0.14 + map(3.0f, 0, finaly, 0, height);
    float hud2 = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    float hud3 = height * 0.14 + map(17.0f, 0, finaly, 0, height);
    float edge = map(35.0f, 0, finalx, 0, width);
    
    float topx = map(702, 0, finalx, 0, width);
    float topy = map(80, 0, finaly, 0, height);
    
    float diff = map(35, 0, finaly, 0, height);
    float h = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    
    stroke(#006600);
    strokeWeight(2.0f);
    fill(0);
    
    //Bottom line clock
    line (width * 0.42f, height * 0.14, width * 0.58f, height * 0.14);
    
    //Left
    line(width * 0.42f, height * 0.14f, width * 0.42f - divide_w, hud1);
    line(width * 0.42f - divide_w, hud1, width * 0.42f - divide_w * 2.0f, hud2);
    line(width * 0.42f - divide_w * 2.0f, hud2, width * 0.42f - divide_w * 3.0f, hud3);
    line(width * 0.42f - divide_w * 3.0f, hud3, edge, height * .19f);
    
    //Right
    line(width * 0.58f, height * 0.14f, width * 0.58f + divide_w, hud1);
    line(width * 0.58f + divide_w, hud1, width * 0.58f + divide_w * 2.0f, hud2);
    line(width * 0.58f + divide_w * 2.0f, hud2, width * 0.58f + divide_w * 3.0f, hud3);
    line(width * 0.58f + divide_w * 3.0f, hud3, width - edge, height * .19f);
    
    //Menu
    arc(width / 2.0f, height * 0.163, topx, topy, (PI / 180.0f) * 51.7f, (PI / 180.0f) * 128.3);
    line(width * 0.58f + divide_w * 2.0f, h, width * 0.58f + divide_w * 2.0f, h + diff);
    line(width * 0.42f - divide_w * 2.0f, h, width * 0.42f - divide_w * 2.0f, h + diff);
    
    upperMenu.mainOptions();
    clock();
  }//end hudOutline()
  
  void clock()
  {
    int hour;
    int min;
    
    float size = map(40, 0, finaly, 0, height);
    float x;
    float y = map(62, 0, finaly, 0, height);
    
    textAlign(CENTER);
    textSize(size);
    fill(#006600);
    
    hour = hour();
    min = minute();
    
    if (hour < 10)
    {
      x = map(345, 0, finalx, 0, width);
      text("0" + hour, x, y);
    }
    else 
    {
      x = map(345, 0, finalx, 0, width);
      text(hour, x, y);
    }//end else
    
    text(":", width / 2, y);
    
    if (min < 10)
    {
      x = map(405, 0, finalx, 0, width);
      text("0" + min, x, y);
    }//end if
    else
    {
      x = map(405, 0, finalx, 0, width);
      text(min, x, y);
    }//end else
    
    date(size);
  }//end clock()
  
  void date(float size)
  {
    int d = day();
    int m = month();
    textSize(size);
    
    if (d < 10)
    {
      text("0" + d, width * .65f, map(63.0f, 0, finaly, 0, height));
    }
    else
    {
      text(d, width * .65f, map(63.0f, 0, finaly, 0, height));
    }
    text("/", width * .69f, map(63.0f, 0, finaly, 0, height));
    if (m < 10)
    {
      text("0" + m, width / 2, height / 2);
    }//end if
    else
    {
      text(m, width * .73f, map(65.5f, 0, finaly, 0, height));
    }//end else
    text("/", width * .77f, map(66.50f, 0, finaly, 0, height));
    text("1", width * .7925f, map(69.0f, 0, finaly, 0, height));
    text("9", width * .8225f, map(71f, 0, finaly, 0, height));
    text("7", width * .85f, map(74.0f, 0, finaly, 0, height));
    text("0", width * .8775f, map(77.0f, 0, finaly, 0, height));
    
    temperature();
  }//end date()
  
  void temperature()
  {
    float angle = 354.0f;
    
    pushMatrix();
    translate(map(130.0f, 0, finalx, 0, width), map(72.0f, 0, finaly, 0, height));
    rotate((((TWO_PI) / 360.f) * angle));
    text("Capsule", 0, 0);
    rotate(-(((TWO_PI) / 360.f) * angle));
    
    angle = 355.205f;
    
    rotate((((TWO_PI) / 360.f) * angle));
    text(":", map(95.0f, 0, finalx, 0, width), map(-1.5f, 0, finaly, 0, height));
    rotate(-(((TWO_PI) / 360.f) * angle));
    
    angle = 358.5f;
    
    rotate((((TWO_PI) / 360.f) * angle));
    text("45'", map(140.0f, 0, finalx, 0, width), map(-4.5f, 0, finaly, 0, height));
    rotate(-(((TWO_PI) / 360.f) * angle));
    
    popMatrix();
  }//end temperature()
}//end CLASS Outline