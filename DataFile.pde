class DataFile
{
  float Log;
  String Date;
  int Health;
  float Engine;
  float Temp;
  float Shields;
  float Oxygen;
  float Reactor;
  
  DataFile(TableRow row)
  {
    this.Log = row.getInt("Log");
    this.Date = row.getString("Date");
    this.Health = row.getInt("Health");
    this.Engine = row.getFloat("Engine");
    this.Temp = row.getFloat("Temp");
    this.Shields =row.getFloat("Shields");
    this.Oxygen = row.getFloat("Oxygen");
    this.Reactor = row.getFloat("Reactor");
  }//end Constructor
}//end CLASS DataFiles