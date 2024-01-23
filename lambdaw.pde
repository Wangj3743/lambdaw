import processing.sound.*;
//import g4p_tools.*;

String title = "Title";          // default
String author = "Author";        // default
String arranger = "Arranger";    // default
float bpm = 120;                 // default
float beat = 0;
float time = 0;
boolean playSong = true;
int vertScroll = 4; // octave
int horiScroll = 0;

SinOsc sin;
SqrOsc sqr;
TriOsc tri;
SawOsc saw;
WhiteNoise white;
Track sinTrack = new Track();
Track sqrTrack = new Track();
Track triTrack = new Track();
Track sawTrack = new Track();
Track whiteTrack = new Track();
int currSin = 0;
int currSqr = 0;
int currTri = 0;
int currSaw = 0;

Pianoroll pianoroll = new Pianoroll();



void setup() {
  size(1280, 720);
  background(255);
  frameRate(60);

  sin = new SinOsc(this);
  sqr = new SqrOsc(this);
  tri = new TriOsc(this);
  saw = new SawOsc(this);
  white = new WhiteNoise(this);

  String[] fileImport = loadStrings("input.lamb");
  importProject(fileImport);  // imports a file called 'input.lamb'
  
  background(36, 36, 37);
  pianoroll.drawKeys();
}

void draw() {
  // drawing the program
  
  
  //fill()
  //rect();
  if (playSong == true) {
    playSong();
  }
  
  //sinTrack.playInstrument();
  //sqrTrack.playInstrument();
  
  //noLoop();
  
  beat += bpm/3600;                                          // += something (1/16 of a beats based on bpm * time)?
}

void playSong() {
  //println("********************************************************************************\n",
  //        "Title: ", title, "\n",
  //        "Author:", author, "\n",
  //        "Arr.:  ", arranger, "\n",
  //        "BPM:   ", bpm, "\n" + 
  //        "********************************************************************************\n\n");

    // SINE
    if (currSin < sinTrack.samples.size()-1) {
      Sample currSinSample = sinTrack.samples.get(currSin);
      if (currSinSample.beat + currSinSample.dur <= beat && beat > 0) {
        currSinSample.stopSound();
        currSin++;
        currSinSample = sinTrack.samples.get(currSin);
      }
      if (currSinSample.beat <= beat) { 
        currSinSample.playSound();
      } 
    }
    
    // SQUARE
    if (currSqr < sqrTrack.samples.size()-1) {
      Sample currSqrSample = sqrTrack.samples.get(currSqr);
      if (currSqrSample.beat + currSqrSample.dur <= beat && beat > 0) {
        currSqrSample.stopSound();
        currSqr++;
        currSqrSample = sqrTrack.samples.get(currSqr);
      }
      if (currSqrSample.beat <= beat) { 
        currSqrSample.playSound();
      } 
    }
    
    // TRIANGLE
    if (currTri < triTrack.samples.size()-1) {
      Sample currTriSample = triTrack.samples.get(currTri);
      if (currTriSample.beat + currTriSample.dur <= beat && beat > 0) {
        currTriSample.stopSound();
        currTri++;
        currTriSample = triTrack.samples.get(currTri);
      }
      if (currTriSample.beat <= beat) { 
        currTriSample.playSound();
      } 
    }
    
    // SAW
    if (currSaw < sawTrack.samples.size()-1) {
      Sample currSawSample = sawTrack.samples.get(currSaw);
      if (currSawSample.beat + currSawSample.dur <= beat && beat > 0) {
        currSawSample.stopSound();
        currSaw++;
        currSawSample = sawTrack.samples.get(currSaw);
      }
      if (currSawSample.beat <= beat) {
        currSawSample.playSound();
      } 
    }
  //frameRate(60);
}
