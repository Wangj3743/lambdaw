class Sample {
  // fields
  String src;
  float amp;
  int dur;
  float freq;
  
    
  // constructor
  // pitch from Hz freq.
  Sample(String s, float a, int d, int f) {
    src = s;
    amp = a;
    dur = d;
    freq = f;
  }
  
  // pitch from music note
  Sample(String s, float a, int d, String n, int o) {
    src = s;
    amp = a;
    dur = d;
    freq = noteToHz(n, o);
    println(n, o, noteToHz(n, o));
  }
  
  
  // methods
  void playSound() {
    println(amp, dur, freq);
    sin.play();
    sin.amp(amp);
    sin.freq(freq);
    delay(dur);
    sin.stop();
  }
}
