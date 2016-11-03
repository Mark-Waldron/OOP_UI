void keyPressed()
{
  if (keyCode == ENTER)
  {
    keyEntered = keyCount;
  }//end if
  if (keyCode == RIGHT)
  {
    keyCount += 1.0f;
  }//end if
  if (keyCode == RIGHT && keyCount == 5)
  {
    keyCount = 0;
  }
  if (keyCode == LEFT && keyCount == 0)
  {
    keyCount = 5;
  }
  if (keyCode == LEFT)
  {
    keyCount -= 1.0;
  }//end else if
}//end keyPressed