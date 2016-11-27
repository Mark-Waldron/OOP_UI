class Songs
{
  SoundFile song;
  
  Songs(SoundFile song)
  {
    this.song = song;
    this.song.play();
    
    duration = this.song.duration();
  }//end constructor
}//end CLASS Songs