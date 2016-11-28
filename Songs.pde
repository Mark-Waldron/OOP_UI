class Songs
{
  SoundFile song;
  
  //Contrustor that plays a song that is passed
  //and calculates its duration
  Songs(SoundFile song)
  {
    this.song = song;
    this.song.play();
    
    duration = this.song.duration();
  }//end constructor
  
  //Stops song
  void stop()
  {
    song.stop();
  }//end stop()
}//end CLASS Songs