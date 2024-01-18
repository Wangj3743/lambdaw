class Sample {
  // fields
  String src;
  float amp;
  float beat; // beginning beat
  float dur;
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
  Sample(String s, float a, float b, float d, String n, int o) {
    src = s;                                    // when finding source, regex for sine and etc
    amp = a;
    beat = b;
    dur = d;
    freq = noteToHz(n, o);
    //println(n, o, noteToHz(n, o));
  }
  
  
  // methods
  void playSound() {
    println(amp, dur, freq);
    sin.play();
    sin.amp(amp);
    sin.freq(freq);
    delay(int((60.0/dur)*1000));
    sin.stop();
  }
}
