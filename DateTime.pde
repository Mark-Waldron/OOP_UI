class DateTime
{
  /*
    A method that will display the digital clock using text and map
    method's
  */
  void clock()
  {
    int hour;
    int min;
    
    float size = map(40, 0, finalx + finaly, 0, width + height);
    float x;
    float y = map(62, 0, finaly, 0, height);
    
    textAlign(CENTER);
    textSize(size);
    fill(green);
    
    strokeWeight(lineSize);
    stroke(green);
    
    //Gets system minute and hour
    hour = hour();
    min = minute();
    
    //Checks that hour is less than 10
    if (hour < 10)
    {
      x = map(345, 0, finalx, 0, width);
      text("0" + hour, x, y);
    }//end if
    else 
    {
      x = map(345, 0, finalx, 0, width);
      text(hour, x, y);
    }//end else
    
    text(":", width / 2, y);
    
    //Checks that minutes is less than 10
    if (min < 10)
    {
      x = map(405, 0, finalx, 0, width);
      text("0" + min, x, y);
    }//end if
    else
    {
      x = map(405, 0, finalx, 0, width);
      text(min, x, y);
    }//end else
    
    //Method that prints the date
    date(size);
  }//end clock()
  
  /*
    Method that will use Processing Library methods
    to retrieve the system date to print on screen
  */
  
  void date(float size)
  {
    int d = day();
    int m = month();
    int year = year();
    int oldYear = 2016 - 1972;
    String currentYear = String.format("%d", (year - oldYear));
    textSize(size);
    
    //Checks that day is less than 10
    if (d < 10)
    {
      text("0" + d, width * .65f, map(63.0f, 0, finaly, 0, height));
    }
    else
    {
      text(d, width * .65f, map(63.0f, 0, finaly, 0, height));
    }
    
    text("/", width * .69f, map(63.0f, 0, finaly, 0, height));
    
    //Checks that the month is less than 10
    if (m < 10)
    {
      text("0" + m, width / 2, height / 2);
    }//end if
    else
    {
      text(m, width * .73f, map(65.5f, 0, finaly, 0, height));
    }//end else
    
    //Output to screen of fictional year
    text("/", width * .77f, map(66.50f, 0, finaly, 0, height));
    text(currentYear.substring(0,1), width * .7925f, map(69.0f, 0, finaly, 0, height));
    text(currentYear.substring(1,2), width * .8225f, map(71f, 0, finaly, 0, height));
    text(currentYear.substring(2,3), width * .85f, map(74.0f, 0, finaly, 0, height));
    text(currentYear.substring(3,4), width * .8775f, map(77.0f, 0, finaly, 0, height));
    
    //Call to display temperatue of ship
    //temperature();
  }//end date()
  
  void temperature()
  {
    float angle = 354.0f;
    
    //Use of push and pop matrix to rotate text
    pushMatrix();
    translate(map(130.0f, 0, finalx, 0, width), map(72.0f, 0, finaly, 0, height));
    rotate((((TWO_PI) / 360.f) * angle));
    text("Capsule", 0, 0);
    rotate(-(((TWO_PI) / 360.f) * angle));
    
    angle = 355.205f;
    
    rotate((((TWO_PI) / 360.f) * angle));
    text(":", map(95.0f, 0, finalx, 0, width), map(-1.5f, 0, finaly, 0, height));
    rotate(-(((TWO_PI) / 360.f) * angle));
    
    angle = 358.5f;
    
    rotate((((TWO_PI) / 360.f) * angle));
    text("45'", map(140.0f, 0, finalx, 0, width), map(-4.5f, 0, finaly, 0, height));
    rotate(-(((TWO_PI) / 360.f) * angle));
    
    popMatrix();
  }//end temperature()
}//end CLASS DateTime