/*
  Mrthod that retrieves a users key inputs
*/

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
    keyCount = 0.0f;
  }//end if
  if (keyCode == LEFT && keyCount == 0)
  {
    keyCount = 5.0f;
  }//end if
  if (keyCode == LEFT)
  {
    keyCount -= 1.0f;
  }//end if
  
  if (keyCode == UP && keyEntered == 0.0f)
  {
    radioToggle += 1.0f;
  }//end if
  if (keyCode == UP && keyEntered == 0.0f && radioToggle == 4.0f)
  {
    radioToggle = 0.0f;
  }//end if
  if (keyCode == DOWN && keyEntered == 0.0f && radioToggle == 0.0f)
  {
    radioToggle = 4.0f;
  }//end if
  if (keyCode == DOWN && keyEntered == 0.0f)
  {
    radioToggle -= 1.0f;
  }//end if
  
  
}//end keyPressed