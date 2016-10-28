class Main_Menu
{
  void mainOptions()
  {
    String choices[] = {"General", "Health", "Jack", "Ship","Logs"};
    float divide = (width * 0.42f + ((width / 15.0f) - map(50, 0, finalx, 0, width))) / 4.0f;
    float diff = map(35, 0, finaly, 0, height);
    float h = height * 0.14 + map(7.0f, 0, finaly, 0, height);
    
    float topx = map(702, 0, finalx, 0, width);
    float topy = map(80, 0, finaly, 0, height);
    
    fill(0);
    
    arc(width / 2.0f, height * 0.163, topx, topy, (PI / 180.0f) * 51.7f, (PI / 180.0f) * 128.3);
    line(width * 0.58f + divide * 2.0f, h, width * 0.58f + divide * 2.0f, h + diff);
    line(width * 0.42f - divide * 2.0f, h, width * 0.42f - divide * 2.0f, h + diff);  
  }//end void
}//end CLASS Menu