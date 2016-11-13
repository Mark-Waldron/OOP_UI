class soundFiles
{
  String file;
  
  soundFiles (TableRow row)
  {
    this.file = row.getString(0);
    println(row.getString(0));
  }//end Constructor
  
  //new SoundFile(this, row.getString(0));
}//end CLASS soundFiles