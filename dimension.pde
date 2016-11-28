//Super class that will initialise screen dimension values
class Dimension
{
  float w1;
  float w2;
  float widthDiv;
  float h1;
  float h2;
  float heightDiv;
  
  void setUp()
  {
    w1 = map(24.5f, 0, finalx, 0, width);
    w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    widthDiv = (w1 + w2) / 2.0f;
    h1 = map(122.0f, 0, finaly, 0, height);
    h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    heightDiv = (h1 + h2) / 2.0f;
  }//end setUp
}//end CLASS Dimension