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
  
  if ((key == 'p' || key == 'P') && keyEntered == 0.0f)
  {
    for (int i = 0; i < playlist.size(); i++)
    {
      playlist.get(i).stop();
    }//end if
    
    playlist.get((int)radioToggle).play();
    play = true;
    theta = 0.0f;
  }//end if
  
  if (key == 's' || key == 'S')
  {
    for (int i = 0; i < playlist.size(); i++)
    {
      playlist.get(i).stop();
    }//end for
    play = false;
  }//end if
  
  if (keyCode == UP && keyEntered == 4.0f)
  {
    if (dataToggle == 0)
    {
      dataToggle = 0;
    }//end health
    else
    {
      dataToggle--;
    }
  }//end if
  
  if (keyCode == DOWN && keyEntered == 4.0f)
  {
    if (dataToggle == 5)
    {
      dataToggle = 5;
    }//end health
    else
    {
      dataToggle++;
    }//end else
  }//end if
  
  if (key == 'z' || key == 'Z')
  {
    saveTable(t, "data/data.csv");
    exit();
  }//end if
}//end keyPressed