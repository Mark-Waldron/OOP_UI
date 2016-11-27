class Songs
{
  SoundFile song;
  
  Songs(SoundFile song)
  {
    this.song = song;
    this.song.play();
    
    duration = this.song.duration();
  }//end constructor
  
  void stop()
  {
    song.stop();
  }//end stop()
}//end CLASS Songs