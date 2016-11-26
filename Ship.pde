class Ship
{
  float w1;
  float w2;
  float widthDiv;
  float h1;
  float h2;
  float heightDiv;
  
  float engine;
  float shields;
  float ox;
  float temp;
  float reactor;
  float rectLength;
  float rectHeight;
  float leftX;
  float bottomY;
  float rightX;
  float topY;
  
  float arcSize;
  float arcDiff;
  
  void statusSetup()
  {
    w1 = map(24.5f, 0, finalx, 0, width);
    w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    widthDiv = (w1 + w2) / 2.0f;
    h1 = map(122.0f, 0, finaly, 0, height);
    h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    heightDiv = (h1 + h2) / 2.0f;
    
    rectLength = map(50.0f, 0, finalx, 0, width);
    rectHeight = map(125.0f, 0, finaly, 0, height);
    leftX = w1 + map(45.0f, 0, finalx, 0, width);
    bottomY = heightDiv + map(20.0f, 0, finaly, 0, height);
    rightX = w2 - map(45.0f, 0, finalx, 0, width) - rectLength;
    topY = heightDiv - map(20.0f, 0, finaly, 0, height) - rectHeight;
    
    arcSize = map(270.0f, 0, finalx + finaly, 0, width + height);
    arcDiff = map(20.0f, 0, finalx + finaly, 0, width + height);
  }//end statusSetup()
  
  void reactor()
  {
    float outline = map(200.0f, 0.0f, finalx + finaly, 0.0f, width + height);
    float diameter = map(reactor, 0, finalx + finaly, 0, width + height);
    float diff = TWO_PI / 360;
    
    strokeWeight(2.0f);
    noStroke();

    pushMatrix();
    translate(width / 2.0f, heightDiv);
    rotate(reactorR1);

    fill(green);
    arc(0, 0, arcSize, arcSize, -PI/2.0f, (-PI/2.0f) + (TWO_PI / 3.0f));
    fill(0);
    arc(0, 0, arcSize - arcDiff, arcSize - arcDiff, -PI/2.0f - diff, ((-PI/2.0f) + (TWO_PI / 3.0f)) + diff);

    popMatrix();

    pushMatrix();
    translate(width / 2.0f, heightDiv);
    rotate(reactorR2);

    fill(green);
    arc(0, 0, arcSize - arcDiff, arcSize - arcDiff, (-PI/2.0f) + (TWO_PI / 3.0f), (-PI/2.0f) + (TWO_PI / 3.0f) * 2.0f);
    fill(0);
    arc(0, 0, arcSize - arcDiff * 2.0f, arcSize - arcDiff * 2.0f, (-PI/2.0f) + (TWO_PI / 3.0f) - diff, (-PI/2.0f) + (TWO_PI / 3.0f) * 2.0f + diff);

    popMatrix();

    pushMatrix();
    translate(width / 2.0f, heightDiv);
    rotate(reactorR3);

    fill(green);
    arc(0, 0, arcSize - arcDiff * 2.0f, arcSize - arcDiff * 2.0f, (-PI/2.0f) + (TWO_PI / 3.0f) * 2.0f, (-PI/2.0f) + (TWO_PI / 3.0f) * 3.0f);
    fill(0);
    arc(0, 0, arcSize - arcDiff * 3.0f, arcSize - arcDiff * 3.0f, (-PI/2.0f) + (TWO_PI / 3.0f) * 2.0f - diff, (-PI/2.0f) + (TWO_PI / 3.0f) * 3.0f + diff);

    popMatrix();

    fill(0);
    stroke(green);
    strokeWeight(1.0f);
    ellipse(width / 2.0f, heightDiv, outline, outline);
    
    strokeWeight(lineSize);
    ellipse(width / 2.0f, heightDiv, diameter, diameter);
    
    //Display of Reactor levels
    textAlign(CENTER, CENTER);
    textSize(map(140.0f, 0.0f, finalx + finaly, 0.0f, diameter));
    fill(green);
    text("Recator Levels", width / 2.0f, heightDiv);
    
    reactorR1 += 0.01f;
    reactorR2 -= 0.02f;
    reactorR3 += 0.03f;
    
    //line(0, heightDiv, width, heightDiv);
    barChart();
  }//end reactor
  
  void barChart()
  { 
    textAlign(LEFT, CENTER);
    strokeWeight(2.0);
    stroke(green);
    fill(0);
    textSize(map(22.0f, 0, finalx + finaly, 0, width + height));
    
    //Bottom
    rect(leftX, bottomY, rectLength, rectHeight);
    rect(rightX, bottomY, rectLength, rectHeight);
    
    //Top
    rect(leftX, topY, rectLength, rectHeight);
    rect(rightX, topY, rectLength, rectHeight);
    
    noStroke();
    fill(green);
    
    textAlign(LEFT, CENTER);
    rect(leftX, topY + (rectHeight - engine), rectLength, rectHeight - (rectHeight - engine));
    text("-ENGINE", leftX + rectLength, topY + (rectHeight - engine));
    
    rect(leftX, bottomY + (rectHeight - ox), rectLength, rectHeight - (rectHeight - ox));
    text("-OXYGEN", leftX + rectLength, bottomY + (rectHeight - ox));
    
    textAlign(RIGHT, CENTER);
    rect(rightX, topY + (rectHeight - shields), rectLength, rectHeight - (rectHeight - shields));
    text("SHIELDS-", rightX, topY + (rectHeight - shields));
    
    rect(rightX, bottomY + (rectHeight - temp), rectLength, rectHeight - (rectHeight - temp));
    text("TEMP-", rightX, bottomY + (rectHeight - temp));
  }//end barChart()
  
  void infoChange()
  { 
    float spike = random(1, 40);
    if (frameCount % 30 == 0 && enginePer != 100)
    {
      enginePer += (int)random(1,3);
    }//end if
    else if (frameCount % 100 == 0 && (enginePer + spike) <= 100)
    {
      enginePer += spike;
    }
    else if (frameCount % 2 == 0 && (enginePer) >= 1)
    {
      enginePer -= (int)random(1,3);
    }
    
    spike = random(1, 40);
    
    if (frameCount % 30 == 0 && shieldsPer != 100)
    {
      shieldsPer += (int)random(1,3);
    }//end if
    else if (frameCount % 100 == 0 && (shieldsPer + spike) <= 100)
    {
      shieldsPer += spike;
    }
    else if (frameCount % 2 == 0 && (shieldsPer) >= 1)
    {
      shieldsPer -= (int)random(1,3);
    }
    
    if (((int)random(0, 4)) == 1 && (oxPer-1) >= 0)
    {
      oxPer--;
    }//end if
    if (((int)random(0, 3)) == 1 && (oxPer+1) <= 100.0f)
    {
      oxPer++;
    }//end if
    
    if (((int)random(0, 18)) == 1 && (tempPer+1) <= 100.0f)
    {
      tempPer++;
    }//end if
    if (((int)random(0, 15)) == 1 && (tempPer-1) >= 1.0f)
    {
      tempPer--;
    }//end if
    
    if (((int)random(0, 5)) == 1 && (reactPer+1) <= 100.0f)
    {
      reactPer++;
    }//end if
    if (((int)random(0, 4)) == 1 && (reactPer-1) >= 1.0f)
    {
      reactPer--;
    }//end if
    
    
    engine = map(map(enginePer, 0, 100f, 0, 125f), 0, finaly, 0, height);
    shields = map(map(shieldsPer, 0, 100f, 0, 125f), 0, finaly, 0, height);
    ox = map(map(oxPer, 0, 100f, 0, 125f), 0, finaly, 0, height);
    temp = map(map(tempPer, 0, 100f, 0, 125f), 0, finaly, 0, height);
    reactor = map(reactPer, 0.0f,100.0f, 100.0f, 200.0f);
    
    engineAverage = (engineAverage + enginePer) / 2.0f;
    shieldAverage = (shieldAverage + shieldsPer) / 2.0f;
    oxyAverage = (oxyAverage + oxPer) / 2.0f;
    tempAverage = (tempAverage + tempPer) / 2.0f;
    reactorAverage = (reactorAverage + reactPer) / 2.0f;
  }//end infoChan
}//end CLASS Ship