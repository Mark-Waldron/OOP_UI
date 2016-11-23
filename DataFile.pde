class DataFile
{
  float Log;
  String Date;
  float Health;
  float Engine;
  float Fuel;
  float Shields;
  float Oxygen;
  float Reactor;
  
  DataFile(TableRow row)
  {
    this.Log = row.getInt("Log");
    this.Date = row.getString("Date");
    this.Health = row.getFloat("Health");
    this.Engine = row.getFloat("Engine");
    this.Fuel = row.getFloat("Fuel");
    this.Oxygen = row.getFloat("Oxygen");
    this.Reactor = row.getFloat("Reactor");
  }//end Constructor
}//end CLASS DataFiles