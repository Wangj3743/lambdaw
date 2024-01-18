// EDITABLE VARIABLES
float bpm = 100;


import beads.*;

AudioContext ac;

void setup() {
  ac = new AudioContext();
  Sample a = new Sample("sine", 0.5, 500, "C", 4);
  Sample b = new Sample("saw", 0.5, 500, "D", 4);
  
  a.playSound();
  b.playSound();
}
