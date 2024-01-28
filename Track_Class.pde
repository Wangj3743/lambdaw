class Track {
  // fields
  ArrayList<Sample> samples = new ArrayList<Sample>();
    
  // constructor
  Track() {
  }
  
  
  // methods
  void playTrack() {
    for (int i=0; i<samples.size(); ++i) {
      samples.get(i).playSound();
    }
  }
  
  float totalBeatDuration() {
    if (samples.size()-1>0) {
      Sample lastSample = samples.get(samples.size()-1);
      return lastSample.dur + lastSample.beat;
    }
    else 
      return 0;
  }
}
