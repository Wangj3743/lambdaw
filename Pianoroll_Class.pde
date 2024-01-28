class Pianoroll {
  // fields
  int keyHeight = 50;
  int keyWidth = 100;
  
  
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
      rect(0, height-i*keyHeight, keyWidth, height-keyHeight-i*keyHeight);
      
      textAlign(CENTER);
      textSize(30);
      fill(0,0,0);
      text(noteLetters[i], 50, height-keyHeight-i*keyHeight); 
    }
  }
  
  void drawVertLines() {
    strokeWeight(2);
    stroke(255,255,255);
    for (float i=0; i<(width/beatWidth); ++i) {
      println(i);
      line(i*beatWidth+keyWidth, height, i*beatWidth+keyWidth, height/2);
    }
  }
  
  void drawHoriLines() {
    
  }
}
