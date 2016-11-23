class DataFile
{
  float Log;
  String Date;
  int Health;
  float Engine;
  float Fuel;
  float Shields;
  float Oxygen;
  float Reactor;
  
  DataFile(TableRow row)
  {
    this.Log = row.getInt("Log");
    this.Date = row.getString("Date");
    this.Health = row.getInt("Health");
    this.Engine = row.getFloat("Engine");
    this.Fuel = row.getFloat("Fuel");
    this.Oxygen = row.getFloat("Oxygen");
    this.Reactor = row.getFloat("Reactor");
  }//end Constructor
  
  /*
    Method to write new data to file when exited
  */
  
  void fileOut()
  {
    
  }//end fileOut
}//end CLASS DataFiles