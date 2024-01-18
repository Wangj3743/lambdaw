class Track {
  // fields
  ArrayList<Sample> samples = new ArrayList<Sample>();
    
  // constructor
  Track() {
  }
  
  
  // methods
  void playInstrument() {
    for (int i=0; i<samples.size(); ++i) {
      print(i+": ");
      samples.get(i).playSound();
    }
  }
}
