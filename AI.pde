class AI
{
  void caller()
  {
    float diameter = map(70.0f, 0, finalx + finaly, 0, width + height);
    ellipse(width / 2.0f, height * .84f, diameter, diameter);
  }//end ellipse
}//end CLASS AI