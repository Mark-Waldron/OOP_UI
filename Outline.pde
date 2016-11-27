class Outline
{
  void hudOutline()
  {
    //Method declarations
    float divide_w = width * 0.105;
    float hud1 = height * 0.14 + map(3.0f, 0, finaly, 0, height);
    float hud2 = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    float hud3 = height * 0.14 + map(17.0f, 0, finaly, 0, height);
    float edge = map(35.0f, 0, finalx, 0, width);
    
    float topx = map(702, 0, finalx, 0, width);
    float topy = map(80, 0, finaly, 0, height);
    
    float diff = map(35, 0, finaly, 0, height);
    float h = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    
    stroke(green);
    strokeWeight(lineSize);
    fill(0);
    
    stroke(green);
    
    line (width * 0.42, (height / 500.0f) * 26.0f, width * 0.42, height * 0.14);
    line (width * 0.58, (height / 500.0f) * 26.0f, width * 0.58, height * 0.14);
    
    //Bottom line clock
    line (width * 0.42f, height * 0.14, width * 0.58f, height * 0.14);
    
    //Left Side
    line(width * 0.42f, height * 0.14f, width * 0.42f - divide_w, hud1);
    line(width * 0.42f - divide_w, hud1, width * 0.42f - divide_w * 2.0f, hud2);
    line(width * 0.42f - divide_w * 2.0f, hud2, width * 0.42f - divide_w * 3.0f, hud3);
    line(width * 0.42f - divide_w * 3.0f, hud3, edge, height * .19f);
    
    //Right Side
    line(width * 0.58f, height * 0.14f, width * 0.58f + divide_w, hud1);
    line(width * 0.58f + divide_w, hud1, width * 0.58f + divide_w * 2.0f, hud2);
    line(width * 0.58f + divide_w * 2.0f, hud2, width * 0.58f + divide_w * 3.0f, hud3);
    line(width * 0.58f + divide_w * 3.0f, hud3, width - edge, height * .19f);
    
    //Menu
    arc(width / 2.0f, height * 0.163, topx, topy, (PI / 180.0f) * 51.7f, (PI / 180.0f) * 128.3);
    line(width * 0.58f + divide_w * 2.0f, h, width * 0.58f + divide_w * 2.0f, h + diff);
    line(width * 0.42f - divide_w * 2.0f, h, width * 0.42f - divide_w * 2.0f, h + diff);
  }//end hudOutline()
}//end CLASS Outline