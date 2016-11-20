class Ship
{
  float w1;
  float w2;
  float widthDiv;
  float h1;
  float h2;
  float heightDiv;
  void statusSetup()
  {
    this.w1 = map(24.5f, 0, finalx, 0, width);
    this.w2 = map(finalx - 24.5f, 0, finalx, 0, width);
    this.widthDiv = (w1 + w2) / 2.0f;
    this.h1 = map(122.0f, 0, finaly, 0, height);
    this.h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    this.heightDiv = (h1 + h2) / 2.0f;
  }//end statusSetup()
  
  void reactor()
  {
    float arcSize = map(270.0f, 0, finalx + finaly, 0, width + height);
    float arcDiff = map(20.0f, 0, finalx + finaly, 0, width + height);
    float diameter = map(200.0f, 0, finalx + finaly, 0, width + height);
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
    ellipse(width / 2.0f, heightDiv, diameter, diameter);
    reactorR1 += 0.01f;
    reactorR2 -= 0.02f;
    reactorR3 += 0.03f;
    
    //line(0, heightDiv, width, heightDiv);
    barChart();
  }//end reactor
  
  void barChart()
  {
    float engine = map(100.0f, 0, finaly, 0, height);
    float shields = map(map(10, 0, 100f, 0, 125f), 0, finaly, 0, height);
    float ox = map(map(100, 0, 100f, 0, 125f), 0, finaly, 0, height);
    float fuel = map(map(100, 0, 100f, 0, 125f), 0, finaly, 0, height);
    float rectLength = map(50.0f, 0, finalx, 0, width);
    float rectHeight = map(125.0f, 0, finaly, 0, height);
    float leftX = w1 + map(45.0f, 0, finalx, 0, width);
    float bottomY = heightDiv + map(20.0f, 0, finaly, 0, height);
    float rightX = w2 - map(45.0f, 0, finalx, 0, width) - rectLength;
    float topY = heightDiv - map(20.0f, 0, finaly, 0, height) - rectHeight;
    
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
    
    rect(rightX, bottomY + (rectHeight - fuel), rectLength, rectHeight - (rectHeight - fuel));
    text("FUEL-", rightX, bottomY + (rectHeight - fuel));
  }//end barChart()
}//end CLASS Ship