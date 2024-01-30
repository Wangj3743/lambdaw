class Sample {
  // fields
  String src;
  float amp;
  float beat; // beginning beat
  float dur;
  String note;
  int octave;
  float freq;
  String condition;
  
    
  // constructor
  // pitch from music note
  Sample(String s, float a, float b, float d, String n, int o) {
    src = s;
    amp = a;
    beat = b;
    dur = d;
    note = n;
    octave = o;
    freq = noteToHz(n, o);
    //println(s, a, b, d, n, o);
  }
  
  // final end, start repeat, end repeat
  Sample(String c) {
    if (c.equals("end") || c.equals("END") || c.equals("||")){
      condition = "end";
    }
  }
  
  // pitch from Hz freq.
  Sample(String s, float a, float d, float f) {
    src = s;
    amp = a;
    dur = d;
    freq = f;
  }
  
  
  // methods
  void playSound() {
    if (src.equals("sine")) {
      sin.amp(amp);
      sin.freq(freq);
      sin.play();
    } else if (src.equals("square")) {
      sqr.play();
      sqr.amp(amp);
      sqr.freq(freq);
    } else if (src.equals("triangle")) {
      tri.play();
      tri.amp(amp);
      tri.freq(freq);
    } else if (src.equals("saw")) {
      saw.play();
      saw.amp(amp);
      saw.freq(freq);
    } else {
      println("ERR failed to play sound");
    }
  }
  
  void stopSound() {
    if (src.equals("sine")) {
      sin.stop();
    } else if (src.equals("square")) {
      sqr.stop();
    } else if (src.equals("triangle")) {
      tri.stop();
    } else if (src.equals("saw")) {
      saw.stop();
    } else {
      println("ERR failed to stop sound");
    }
  }
  
  void drawSample() {
    String[] noteLetters = new String[] {"A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"};
    int currNoteIndex = binarySearch(noteLetters, note, 0, 11);
    fill(255,00,00);
    noStroke();
    
    // fill color based on waveform type
    if (this.src == "sine") {
      fill(0xcceb4f65);
    } else if (this.src == "triangle") {
      fill(0xcc1061af);
    } else if (this.src == "square") {
      fill(0xcc4fb44b);
    } else if (this.src == "saw") {
      fill(0xccf6d03e);
    }
    
    //draw note (rounded corners; "oblong")
    rect(this.beat*beatWidth+keyWidth, height-currNoteIndex*keyHeight, this.dur*beatWidth, -keyHeight, 5, 5, 5, 5);
  }
}
