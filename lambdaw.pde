// import
import processing.sound.*;


// Global Variables
SinOsc sine;


void setup () {
  //noteToHz("C", 2);
  size(1280, 720);
  sine = new SinOsc(this);
  sine.play();
  sine.freq(261.63);
  sine.amp(.3);
}


void draw() {
  // Main GUI
}


float noteToHz(String note, int octave) { // only takes "N#" as a musical accidental
  // assuming that A4 = 440Hz
  String[] noteLetters = new String[] {"A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"};
  for (int i=0; i<12; ++i) {
    binarySearch(noteLetters, note, 0, 11);
  }
  int currNote; // # of semitones from A4
  int currOcta; // octave #
  int ans = 0;
  return ans;
}

int binarySearch(String[] arr, String tar, int left, int right) {
  int curr = 0;
  // base case
  if (tar == left) {
    return left;
  } else {
    int mid = (left+right)/2;
    if (tar > x)
  }
  
  // recursive case
  
}
