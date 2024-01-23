class Pianoroll {
  // fields
  int keyHeight = 50;
  
  
  // constructor
  Pianoroll() {
    
  }
  
  
  // methods
  void drawKeys() {
    String[] noteLetters = new String[] {"A", "B", "C", "D", "E", "F", "G"};
    for (int i=0; i<7; ++i) {
      stroke(0);
      strokeWeight(2);
      fill(255,255,255);
      rect(0, height-i*keyHeight, 100, height-keyHeight-i*keyHeight);
      
      //textAlign(CENTER);
      //textSize(30);
      //fill(0,0,0);
      //text(noteLetters[i], 70, height-keyHeight-i*keyHeight); 
    }
  }
}
