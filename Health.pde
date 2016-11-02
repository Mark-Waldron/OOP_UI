class Health
{
  void drawGraph()
  {
    stroke(255);
    line(width / 2.0f, height / 2.0f + map(22, 0, finaly, 0, height), map(592.5f, 0, finalx, 0, width), height / 2.0f + map(22, 0, finaly, 0, height));
  }//end drawGraph()
}//end class Health