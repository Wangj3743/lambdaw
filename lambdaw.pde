// EDITABLE VARIABLES
float bpm = 60;


import processing.sound.*;

SinOsc sin;
SqrOsc sqr;
TriOsc tri;
SawOsc saw;

Track sinTrack = new Track();
Track sqrTrack = new Track();
Track triTrack = new Track();
Track sawTrack = new Track();


void setup() {
  size(640, 360);
  background(255);

  sin = new SinOsc(this);
  sqr = new SqrOsc(this);
  tri = new TriOsc(this);
  saw = new SawOsc(this);
  
  String[] fileImport = loadStrings("input.txt");
  importProject(fileImport);  // imports a file called 'input.txt'
}

void draw() {
  // GUI
  background(36, 36, 37);
  //fill()
  //rect();

  //a.playSound();
  //b.playSound();
  //c.playSound();
  //d.playSound();
  sinTrack.playInstrument();
}
