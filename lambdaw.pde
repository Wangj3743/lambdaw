// import
import processing.sound.*;


// Global Variables
SinOsc sine;


void setup () {
  size(1280, 720);
  sine = new SinOsc(this);
  sine.play();
  sine.freq(261.63);
  sine.amp(.3);
}


void draw() {
  // Main GUI
}


float noteToHz() {
  
}