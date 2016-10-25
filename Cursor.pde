class Cursor
{
  void hover()
  {
    float diff = 10;
    noCursor();
    stroke(#006600);
    fill(0);
    
    line(mouseX - diff, mouseY, mouseX, mouseY + diff);
    line(mouseX, mouseY + diff, mouseX + diff, mouseY);
    line(mouseX + diff, mouseY, mouseX, mouseY - diff);
    line(mouseX, mouseY - diff, mouseX - diff, mouseY);
    
    ellipse(mouseX, mouseY, 1.5, 1.5);
  }//end hover()
}//end CLASS Cursor