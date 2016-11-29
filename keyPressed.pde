/*
  Method that retrieves a users key inputs
*/

void keyPressed()
{
  //Main menu toggle checks
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
  
  //Checks if the UP or DOWN is pressed on the radio menu
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
  
  //Plays selected song 
  if ((key == 'p' || key == 'P') && keyEntered == 0.0f)
  {
    if (playing > -1 || play == true)
    {
      playlist.get(playing).stop();
    }//end if
    
    playing = (int)radioToggle;
    playPause = new Songs(playlist.get((int)radioToggle));
    playTime = frameCount + (duration * 60.0f);
    play = true;
    theta = 0.0f;
  }//end if
  
  //Stops current song
  if (key == 's' || key == 'S')
  {
    if (play == true && playing > -1)
    {
      playlist.get(playing).stop();
    }//end if
    
    playing = -1;
    play = false;
  }//end if
  
  //Check for all values
  if ((key == 'q' || key == 'Q') && keyEntered == 2.0f && enginePer < 30)
  {
    enginePer = random(30, 70);
  }//end if
  if ((key == 'w' || key == 'W') && keyEntered == 2.0f && shieldsPer < 30)
  {
    shieldsPer = random(30, 70);
  }//end if
  if ((key == 'e' || key == 'E') && keyEntered == 2.0f && oxPer < 30)
  {
    oxPer = random(30, 70);
  }//end if
  if ((key == 'r' || key == 'R') && keyEntered == 2.0f && tempPer < 30)
  {
    tempPer = random(30, 70);
  }//end if
  if ((key == 't' || key == 'T') && keyEntered == 2.0f && reactPer < 30)
  {
    reactPer = random(30, 70);
  }//end if
  
  
  
  //Changes graph data being shown
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
  
  //Changes graph data being shown
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
  
  //Exit condition that saves all current data to a csv file
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