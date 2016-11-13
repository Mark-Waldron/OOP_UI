class Radio
{
  void test()
  {
    tint(#006600);
    float jkf_X = map((finalx / 4.0f) * 3.0f - 50.0f, 0, finalx, 0, width);
    image(jfk, jkf_X, (height / 2.0f - (jfkHeight / 2.0f) / 2.0f) + map(22, 0, finaly, 0, height), jfkWidth / 2.0f, jfkHeight / 2.0f);
  }//end test
}//end CLASS Radio