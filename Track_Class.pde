class Track {
  // fields
  ArrayList<Sample> samples = new ArrayList<Sample>();
    
  // constructor
  Track() {
  }
  
  
  // methods
  void playTrack(String waveform) {
    Sample currWaveSample = null; //<>//
    println(beat);
    if (waveform.equals("sin") && currSin < this.samples.size()) {
      currWaveSample = sinTrack.samples.get(currSin);
      if (beat > this.totalBeatDuration()) {
        this.stopTrack("sin");
        sinTrack.stopTrack("sin");
        println("STOP PLEASE");
      }
    } else if (waveform.equals("tri") && currTri < this.samples.size()) {
      currWaveSample = triTrack.samples.get(currTri);
      if (beat > this.totalBeatDuration()) {
        this.stopTrack("tri");
      }
    } else if (waveform.equals("sqr") && currSqr < this.samples.size()) {
      currWaveSample = sqrTrack.samples.get(currSqr);
      if (beat > this.totalBeatDuration()) {
        this.stopTrack("sqr");
      }
    } else if (waveform.equals("saw") && currSaw < this.samples.size()) {
      currWaveSample = sawTrack.samples.get(currSaw);
      if (beat > this.totalBeatDuration()) {
        this.stopTrack("saw");
      }
    } else {
      return;
    }
    
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
    }
    if (currWaveSample.beat <= beat) { 
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
}
