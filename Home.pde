class Home extends Dimension
{ 
  /*
    Method that initalises super class
  */
  void setUp()
  {
    super.setUp();
  }//end statusSetup()
  
  /*
    A method that will draw the home's radar screen with use of the 
    arc function
  */
  
  void radar()
  {
    float diameter = map(130.0f, 0, finalx + finaly, 0, width + height);
    color black = 0;
    float index = 0;
    noStroke();
    fill(0);
    strokeWeight(lineSize);
    
    ellipse(width * .85, height * .75f, diameter, diameter);
    
    diameter -= map(10.0f, 0, finalx + finaly, 0, width + height);
    
    stroke(green);
    ellipse(width * .85, height * .75f, diameter, diameter);
    
    //Radar draw
    noStroke();
    fill(green);
    pushMatrix();
    
    translate(width * .85, height * .75f);
    rotate(count);
    
    for(float i = TWO_PI / 4.0f; i >= 0; i -= ((TWO_PI / 4.0f) / 100.0f))
    {
      color x = lerpColor(green, black, index);
      fill(x);
      arc(0.0f, 0.0f, diameter, diameter, count + i - ((TWO_PI / 4.0f) / 90.0f), count + i);
      index += .01;
    }//end for
    //text(String.format("%.1f", distance), (w2 - w1) / 4.0f, (h2 - h1) / 2.0f);
    
    index = 0;
    
    popMatrix();
    
    //Check to ensure radar points are changed when radar
    //arc passes the area
    if (count < PI && astCheck == 0)
    {
      //Prevents check from preforming again until arc leaves area
      astCheck = 1;
      
      //Loop to set values of the array
      for(int i = 0; i < 20; i++)
      {
        astLocation[0][i] = random(PI, TWO_PI);
        astLocation[1][i] =  random(0, (diameter / 2.0f) - 1);
      }//end for
    }//end if
    else if (count >= PI && astCheck == 1)
    {
      //Prevents check from preforming again until arc leaves area
      astCheck = 0;
      
      //Loop to set values of the array
      for(int i = 20; i < 40; i++)
      {
        stroke(0);
        fill(0);
        astLocation[0][i] = random(0, PI);
        astLocation[1][i] =  random(0, (diameter / 2.0f) - 1);
      }//end for
    }//end else if
    
    //Sketches points on radar scope
    for(int i = 0; i < 40; i++)
    {
      stroke(0);
      point(width * .85 + astLocation[1][i] * cos(astLocation[0][i]), height * .75f + astLocation[1][i] * sin(astLocation[0][i]));
    }//end for
    
    count += TWO_PI / 360.0f;
    
    //Ensures the radar counter is rest
    //to prevent any overflow
    if (count > TWO_PI)
    {
      count = 0.0f;
    }//end if
  }//end radar
  
  /*
    Method that prints the status of all primary ship components
  */
  void checkStatus()
  {
    float rowDiff = (height / 15.0f);
    int nameCount = 0;
    
    fill(green);
    textAlign(LEFT, CENTER);
    textSize(map(20, 0, finalx + finaly, 0, width + height));
    strokeWeight(1.0f);
    
    //Data is printed in numberical values
    for (float i = -2.0f; i < 3.0f; i += 1.0f)
    {
      textAlign(LEFT, CENTER);
      String formatted = String.format("%.00f", dataPerArray[nameCount]);
      
      //Check if it above 30%
      if (dataPerArray[nameCount] > 30.0f)
      {
        stroke(0);
        fill(0);
        rect(w1 + map(15.0f, 0, finalx, 0, width), heightDiv - (rowDiff / 2.0f) + (rowDiff * i), width / 4.0f, height / 15.0f);
        
        fill(green);
        text(dataNames[nameCount] + ":" + formatted + "%", w1 + map(15.0f, 0, finalx, 0, width), heightDiv - (rowDiff / 2.0f) + (rowDiff * i), width / 4.0f, height / 15.0f);
        
        nameCount++;
      }//end if
      else
      {
        stroke(green);
        fill(green);
        rect(w1 + map(15.0f, 0, finalx, 0, width), heightDiv - (rowDiff / 2.0f) + (rowDiff * i), width / 4.0f, height / 15.0f);
        fill(0);
        text(dataNames[nameCount] + ":" + formatted + "%", w1 + map(15.0f, 0, finalx, 0, width), heightDiv - (rowDiff / 2.0f) + (rowDiff * i), width / 4.0f, height / 15.0f);
        
        //Warning display
        fill(green);
        textAlign(CENTER, CENTER);
        text("Warning:Press " + charReset[nameCount] + " to Restore", widthDiv + map(20, 0, finalx, 0, width), heightDiv + (rowDiff * i));
        
        nameCount++;
      }//end else
    }//end for
    
    //Prints the title of the status
    textAlign(CENTER, CENTER);
    fill(green);
    text("Ship Status", w1 + map(15.0f, 0, finalx, 0, width), heightDiv - (rowDiff / 2.0f) + (rowDiff * -3.0f), width / 4.0f, height / 15.0f);
    
    if (play == true)
    {
      Icons sound = new Icons();
      sound.radioDraw();
      shape(radio, width * .39, height * .089f);
      //fill(green);
      //textAlign(CENTER, TOP);
      //textSize(map(30, 0, finalx + finaly, 0, width + height));
      //text(files[playing].substring(0, files[playing].length() - 4), width / 2.0f, heightDiv + map(20.0f, 0, finaly, 0, height));
    }//end if
  }//end checkStatus()
  
  /*
    Method that acts acts as a homepage for a user
  */
  
  void Welcome()
  {
    color x = lerpColor(0, green, homeIndex);
    
    //Increases the lerp index until 1
    if (homeIndex > 1.0f)
    {
      homeIndex = 1.0f;
    }
    else
    {
      homeIndex += (1.0f / 210.0f);
    }//end else
    
    fill(x);
    
    textSize(map(40, 0, finalx + finaly, 0, width + height));
    textAlign(CENTER, CENTER);
    
    text("Welcome", widthDiv, heightDiv - (heightDiv / 2.0f));
    
    textSize(map(29, 0, finalx + finaly, 0, width + height));
    
    text("Use the LEFT and RIGHT Keys to navigate", widthDiv, heightDiv - (heightDiv / 3.0f));
    text("Use ENTER to choose Menu option", widthDiv, ((heightDiv + (heightDiv / 3.0f)) + (heightDiv - (heightDiv / 3.0f))) / 2.0f);
    text("Press the Z Key to exit", widthDiv, heightDiv + (heightDiv / 3.0f));
  }//end Welcome
}//end class