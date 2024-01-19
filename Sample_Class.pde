class Sample {
  // fields
  String src;
  float amp;
  float beat; // beginning beat
  float dur;
  String note;
  int octave;
  float freq;
  
    
  // constructor
  // pitch from Hz freq.
  Sample(String s, float a, float d, float f) {
    src = s;
    amp = a;
    dur = d;
    freq = f;
  }
  
  // pitch from music note
  Sample(String s, float a, float b, float d, String n, int o) {
    src = s;                                                    // when finding source, regex for sine and etc
    amp = a;
    beat = b;
    dur = d;
    note = n;
    octave = o;
    freq = noteToHz(n, o);
  }
  
  
  // methods
  void playSound() {
    if (src.equals("sine")) {
        sin.play();
        sin.amp(amp);
        sin.freq(freq);
        delay(int((60.0/bpm)*dur*1000));
        sin.stop();
    } else if (src.equals("square")) {
        sqr.play();
        sqr.amp(amp);
        sqr.freq(freq);
        delay(int((60.0/bpm)*dur*1000));
        sqr.stop();
    } else if (src.equals("triangle")) {
        tri.play();
        tri.amp(amp);
        tri.freq(freq);
        delay(int((60.0/bpm)*dur*1000));
        tri.stop();
    } else if (src.equals("saw")) {
        saw.play();
        saw.amp(amp);
        saw.freq(freq);
        delay(int((60.0/bpm)*dur*1000));
        saw.stop();
    } else  {
      // white noise
    }
  }
}
