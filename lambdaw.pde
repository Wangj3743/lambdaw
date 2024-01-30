import processing.sound.*;
import g4p_controls.*;

String title = "<Title>";          // default
String author = "<Author>";        // default
String arranger = "<Arranger>";    // default
float bpm = 120;                 // default
float beat = 0;
boolean playSong = false;
float beatWidth = 75; // width of each beat
int keyHeight = 35;
int keyWidth = 100;

SinOsc sin;
SqrOsc sqr;
TriOsc tri;
SawOsc saw;
Track sinTrack = new Track();
Track sqrTrack = new Track();
Track triTrack = new Track();
Track sawTrack = new Track();
Track longestTrack = sinTrack;
int currSin = 0;
int currSqr = 0;
int currTri = 0;
int currSaw = 0;
boolean showSin = true;
boolean showSqr = true;
boolean showTri = true;
boolean showSaw = true;

Pianoroll pianoroll = new Pianoroll();
Trackroll trackroll = new Trackroll();


void setup() {
  createGUI();
  size(1280, 720);
  background(255);
  frameRate(60);
  textAlign(CENTER);

  // create new waveform oscillations
  sin = new SinOsc(this);
  sqr = new SqrOsc(this);
  tri = new TriOsc(this);
  saw = new SawOsc(this);
}

void draw() {
  // drawing the program
  background(36, 36, 37);
  pianoroll.drawPianoroll();
  trackroll.drawTrackroll();
  drawframe();

  // show waveforms based on user's choice
  if (showSaw == true) {
    sawTrack.drawTrack();
  } if (showSqr == true) {
    sqrTrack.drawTrack();
  } if (showTri == true) {
    triTrack.drawTrack();
  } if (showSin == true) {
    sinTrack.drawTrack();
  } 

  if (playSong == true) {
    playSong();
    beat += bpm/3600;
  }
  
  // playhead movement
  stroke(255,0,0);
  line(beat*beatWidth+keyWidth, 0, beat*beatWidth+keyWidth, height);
}
