float noteToHz(String note, int octave) { 
  // only takes "N#" as a musical accidental, no "Nb"
  // assuming that A4 = 440Hz
  int currNoteIndex=0; // note as an index from the array below
  int semitones=0; // # of semitones from A4
  float ans=0;
  String[] noteLetters = new String[] {"A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"};
  for (int i=0; i<12; ++i) { // find note as an index on the array
    currNoteIndex = binarySearch(noteLetters, note, 0, 11);
  }
  if (currNoteIndex <= 2) { // octave changes every C note (A4, A#4, B4, C5, C#5)
    semitones = (currNoteIndex) + 12*(octave-4);
  }
  else {
    semitones = (currNoteIndex) + 12*(octave-5);
  }
  ans = 440*pow((2), (semitones/12.0));
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
