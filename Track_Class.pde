class Track {
  // fields
  ArrayList<Sample> samples = new ArrayList<Sample>();
  
  
  // constructor
  Track() {}
  
  
  // methods
  void playTrack(String waveform) {
    Sample currWaveSample = null; //<>//
    
    // get curr wave sample
    if (waveform.equals("sin") && currSin < this.samples.size()) {
        currWaveSample = sinTrack.samples.get(currSin);
    } else if (waveform.equals("tri") && currTri < this.samples.size()) {
        currWaveSample = triTrack.samples.get(currTri);
    } else if (waveform.equals("sqr") && currSqr < this.samples.size()) {
        currWaveSample = sqrTrack.samples.get(currSqr);
    } else if (waveform.equals("saw") && currSaw < this.samples.size()) {
        currWaveSample = sawTrack.samples.get(currSaw);
    } else {
      return;
    }
    
    // stop sounds from each track
    if (currWaveSample.beat + currWaveSample.dur <= beat && beat > 0) {
      currWaveSample.stopSound();
      if (waveform.equals("sin")) {
        currSin++;
      }
      if (waveform.equals("tri")) {
        currTri++;
      }
      if (waveform.equals("sqr")) {
        currSqr++;
      }
      if (waveform.equals("saw")) {
        currSaw++;
      }
    } else if (currWaveSample.beat <= beat) { 
      // stop sounds from each track
      currWaveSample.playSound();
    } 
  }
  
  void stopTrack(String waveform) {
    if (waveform.equals("sin") && currSin < this.samples.size()) {
      sinTrack.samples.get(currSin).stopSound();
    } else if (waveform.equals("tri") && currTri < this.samples.size()) {
      triTrack.samples.get(currTri).stopSound();
    } else if (waveform.equals("sqr") && currSqr < this.samples.size()) {
      sqrTrack.samples.get(currSqr).stopSound();
    } else if (waveform.equals("saw") && currSaw < this.samples.size()) {
      sawTrack.samples.get(currSaw).stopSound();
    } else {
      return;
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
  
  // draws track (draws all of it's samples)
  void drawTrack() {
    for (int i=0; i<this.samples.size(); ++i) {
      this.samples.get(i).drawSample();
    }
  }
}
