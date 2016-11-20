class Ship
{
  void statusSetup()
  {
    float h1 = map(122.0f, 0, finaly, 0, height);
    float h2 = map(finaly - 25.0f, 0, finaly, 0, height);
    float heightDiv = (h1 + h2) / 2.0f;
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
  }//end statusSetup()
}//end CLASS Ship