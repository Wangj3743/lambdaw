class Pianoroll {
  // fields
  
  
  // constructor
  Pianoroll() {}
  
  
  // methods
  void drawPianoroll() {
    String[] noteLetters = new String[] {"A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"};
    textSize(30);
    
    for (int i=0; i<12; ++i) {
      noStroke();
      
      if (noteLetters[i].contains("#")) {
        // BLACK KEYS
        fill(0);
        rect(0, height-i*keyHeight-keyHeight, keyWidth, keyHeight);
        // BLACK KEY TEXT
        fill(255);
        text(noteLetters[i], keyWidth-keyWidth/2, height-keyHeight/2-i*keyHeight+10); 
        
      } else {
        // WHITE KEYS
        fill(255);
        rect(0, height-i*keyHeight-keyHeight, keyWidth, keyHeight);
        // WHITE KEY TEXT
        fill(0);
        text(noteLetters[i], keyWidth-keyWidth/2, height-keyHeight/2-i*keyHeight+10); 
      }
      
      // key lines
      stroke(255);
      line(0, height-keyHeight-i*keyHeight, width, height-keyHeight-i*keyHeight); 
    }
  }
}
