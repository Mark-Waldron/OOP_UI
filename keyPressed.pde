/*
  Method that retrieves a users key inputs
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
    if (playing > -1 || play == true)
    {
      playlist.get(playing).stop();
    }//end if
    
    playing = (int)radioToggle;
    Songs playPause = new Songs(playlist.get((int)radioToggle));
    play = true;
    theta = 0.0f;
  }//end if
  
  if (key == 's' || key == 'S')
  {
    if (play == true && playing > -1)
    {
      playlist.get(playing).stop();
    }//end if
    
    playing = -1;
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
    TableRow newRow = t.addRow();
    newRow.setInt("Log", data.size() + 1);
    newRow.setString("Date", dateString);
    newRow.setInt("Health", healthAverage);
    newRow.setFloat("Engine", engineAverage);
    newRow.setFloat("Temp", tempAverage);
    newRow.setFloat("Shields", shieldAverage);
    newRow.setFloat("Oxygen", oxyAverage);
    newRow.setFloat("Reactor", reactorAverage);
    
    saveTable(t, "data/data.csv");
    
    exit();
  }//end if
}//end keyPressed