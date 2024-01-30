import processing.sound.*;
import g4p_controls.*;

String title = "Title";          // default
String author = "Author";        // default
String arranger = "Arranger";    // default
float bpm = 120;                 // default
float beat = 0;
float time = 0;
boolean playSong = false;
int vertScroll = 4; // octave
int horiScroll = 0;
float beatWidth =  50; // width of each beat 
int keyHeight = 35;
int keyWidth = 100;

SinOsc sin;
SqrOsc sqr;
TriOsc tri;
SawOsc saw;
//WhiteNoise white;
Track sinTrack = new Track();
Track sqrTrack = new Track();
Track triTrack = new Track();
Track sawTrack = new Track();
//Track whiteTrack = new Track();
int currSin = 0;
int currSqr = 0;
int currTri = 0;
int currSaw = 0;

Pianoroll pianoroll = new Pianoroll();
Trackroll trackroll = new Trackroll();
Playhead playhead = new Playhead();



void setup() {
  createGUI();
  size(1280, 720);
  background(255);
  frameRate(60);
  textAlign(CENTER);

  sin = new SinOsc(this);
  sqr = new SqrOsc(this);
  tri = new TriOsc(this);
  saw = new SawOsc(this);
  //white = new WhiteNoise(this);

  String[] fileImport = loadStrings("input.lamb");
  importProject(fileImport);  // imports a file called 'input.lamb'
  
  
}

void draw() {
  // drawing the program
  background(36, 36, 37);
  pianoroll.drawPianoroll();
  trackroll.drawTrackroll();
  drawVertLines();
  
  
  if (playSong == true) {
    playSong();
    playhead.move();
    beat += bpm/3600;
  }
  //println(beat);
  
}

void playSong() {
  //println("********************************************************************************\n",
  //        "Title: ", title, "\n",
  //        "Author:", author, "\n",
  //        "Arr.:  ", arranger, "\n",
  //        "BPM:   ", bpm, "\n" + 
  //        "********************************************************************************\n\n");

  sinTrack.playTrack("sin");
  triTrack.playTrack("tri");
  sqrTrack.playTrack("sqr");
  sawTrack.playTrack("saw");
}
