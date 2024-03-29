float noteToHz(String note, int octave) { 
  // only takes "N#" as a musical accidental, no "Nb" or double sharp/flat
  // assuming that A4 = 440Hz
  
  int currNoteIndex = 0; // note as an index from the array below
  int semitones = 0; // # of semitones from A4
  float ans = 0;
  String[] noteLetters = new String[] {"A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"};
  
  for (int i=0; i<12; ++i) { // find note as an index on the array
    currNoteIndex = binarySearch(noteLetters, note, 0, 11);
  } if (currNoteIndex <= 2) { // octave changes every C note (A4, A#4, B4, C5, C#5)
    semitones = (currNoteIndex) + 12*(octave-4);
  } else if ((currNoteIndex >= 2)) {
    semitones = (currNoteIndex) + 12*(octave-5);
  } else {
    return -1; // something went wrong
  }
  
  ans = 440*pow((2), (semitones/12.0)); //equation for note to freq is $440\left(2\right)^{\frac{x}{12}}$ (x = semitones from A4)
  return ans;
}


int binarySearch(String[] arr, String tar, int start, int end) {
  // base case
  if (start > end) {
    return -1; // not foumd; error
    
  // recursive case
  } else {
    int mid = (start+end)/2;
    if (tar.equals(arr[mid])) {
      return mid;
    } else if (tar.compareTo(arr[mid]) > 0) {
      return binarySearch(arr, tar, mid+1, end);
    } else {
      return binarySearch(arr, tar, start, mid-1);
    }
  }
}


void drawframe() {
  textSize(30);
  strokeWeight(2);
  stroke(255,255,255);
  
  // vertical lines
  for (int i=0; i<(width/beatWidth); ++i) {
    
    line(i*beatWidth+keyWidth, height, i*beatWidth+keyWidth, 0);
  }
  
  // middle bar
  fill(26,26,26);
  rect(0, height-15*keyHeight, width, 3*keyHeight);
  
  // middle bar beat numbers
  for (int i=0; i<(width/beatWidth); ++i) {
    // beat # text
    fill(255);
    text(i, keyWidth+i*beatWidth, height-13*keyHeight-5);
  }
}


void playSong() {
  if (beat == 0) {
    println("********************************************************************************\n",
            "Title: ", title, "\n",
            "Author:", author, "\n",
            "Arr.:  ", arranger, "\n",
            "BPM:   ", bpm, "\n" +
            "********************************************************************************\n\n");
  }

  sinTrack.playTrack("sin");
  triTrack.playTrack("tri");
  sqrTrack.playTrack("sqr");
  sawTrack.playTrack("saw");
}
