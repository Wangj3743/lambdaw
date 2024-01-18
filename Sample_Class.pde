class Sample {
  // fields
  Buffer src;
  float amp;
  int dur;
  float freq;
  
    
  // constructor
  // pitch from Hz freq.
  Sample(String s, float a, int d, int f) {
    src = findWaveForm(s);
    amp = a;
    dur = d;
    freq = f;
  }
  
  // pitch from music note
  Sample(String s, float a, int d, String n, int o) {
    src = findWaveForm(s);
    amp = a;
    dur = d;
    freq = noteToHz(n, o);
  }
  
  
  // methods
  void playSound() {
    WavePlayer wp1 = new WavePlayer(ac, freq, src);
    ac.out.addInput(wp1);
    ac.start();
    delay(dur);
    ac.stop();
  }
  
  Buffer findWaveForm(String s) {
    if (s.equalsIgnoreCase("sine") || s.equalsIgnoreCase("sin")) {
      return Buffer.SINE;
    } else if (s.equalsIgnoreCase("square") || s.equalsIgnoreCase("sqr")) {
      return Buffer.SQUARE;
    } else if (s.equalsIgnoreCase("triangle") || s.equalsIgnoreCase("tri")) {
      return Buffer.TRIANGLE;
    } else if (s.equalsIgnoreCase("SAW")) {
      return Buffer.SAW;
    } else {
      return Buffer.NOISE;
    }
  }
}
