class Sample {
  // fields
  String src;
  int amp;
  int freq;
  String note;
  
    
  // constructor
  // pitch from Hz freq.
  Sample(String s, int a, int f) {
    src = s;
    amp = a;
    freq = f;
  }
  
  // pitch from music note
  Sample(String s, int a, String n) {
    src = s;
    amp = a;
    note = n;
    
    //freq = 
  }
  
  
  // methods
  void playSound() {
    
  }
  
  void stopSound() {
  }
}
