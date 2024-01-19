import processing.sound.*;

String title = "Title";          // default
String author = "Author";        // default
String arranger = "Arranger";    // default
float bpm = 120;                 // default
float beat = 0;
float time = 0;

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



void setup() {
  size(640, 360);
  background(255);

  sin = new SinOsc(this);
  sqr = new SqrOsc(this);
  tri = new TriOsc(this);
  saw = new SawOsc(this);
  white = new WhiteNoise(this);

  String[] fileImport = loadStrings("input.txt");
  importProject(fileImport);  // imports a file called 'input.txt'
}

void draw() {
  // GUI
  background(36, 36, 37);
  //fill()
  //rect();



  //sinTrack.playInstrument();
  //sqrTrack.playInstrument();
  playTrack();
}

void playTrack() {
  int currSin = 0;
  int currSqr = 0;
  int currTri = 0;
  int currSaw = 0;
  
  println("********************************************************************************\n", 
            "Title:", title, "\n" +
            "Author:", author, "\n" +
            "Arr.:", arranger, "\n" + 
            "********************************************************************************\n\n");
  
  while (true) {                                            // needs exit condition       
    if (sinTrack.samples.get(currSin).beat == beat) {
      Sample currSample = sinTrack.samples.get(currSin);
      println("beat #" + beat + "\t", 
              "for", currSample.dur, "beats   \t",
              "SIN #" + currSin + "  \t", 
              currSample.note + Integer.toString(currSample.octave), "note (" + currSample.freq + "Hz)");
      currSample.playSound();
      currSin++;
    } 
    
    //if (sqrTrack.samples.get(currSqr).beat == beat) {
    //  Sample currSample = sqrTrack.samples.get(currSqr);
    //  println("beat #" + beat + "\t", 
    //          "for", currSample.dur, "beats   \t",
    //          "SQR #" + currSqr + "  \t", 
    //          currSample.note + Integer.toString(currSample.octave), "note (" + currSample.freq + "Hz)");
    //  sqrTrack.samples.get(currSqr).playSound();
    //  currSqr++;
    //} 
    
    //if (triTrack.samples.get(currTri).beat == beat) {
    //  Sample currSample = triTrack.samples.get(currTri);
    //  println("beat #" + beat + "\t", 
    //          "for", currSample.dur, "beats   \t",
    //          "TRI #" + currTri + "  \t", 
    //          currSample.note + Integer.toString(currSample.octave), "note (" + currSample.freq + "Hz)");
    //  triTrack.samples.get(currTri).playSound();
    //  currTri++;
    //} 
    
    //if (sawTrack.samples.get(currSaw).beat == beat) {
    //  Sample currSample = sawTrack.samples.get(currSaw);
    //  println("beat #" + beat + "\t", 
    //          "for", currSample.dur, "beats   \t",
    //          "SAW #" + currSaw + "  \t", 
    //          currSample.note + Integer.toString(currSample.octave), "note (" + currSample.freq + "Hz)");
    //  sawTrack.samples.get(currSaw).playSound();
    //  currSaw++;
    //}

    beat += 0.125;                                          // += something (x number of beats based on bpm)?
  }
}
