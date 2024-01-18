// EDITABLE VARIABLES
float bpm = 60;


import processing.sound.*;

SinOsc sin;
SqrOsc sqr;
TriOsc tri;
SawOsc saw;

Track sineTrack = new Track();

//Sample a = new Sample("sine", 0.5, 1000, "C", 4);
//Sample b = new Sample("sine", 0.5, 500, "C", 4);
//Sample c = new Sample("sine", 0.5, 500, "D", 4);
//Sample d = new Sample("sine", 0.5, 1000, "D#", 4);


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
  sineTrack.playInstrument();
}
