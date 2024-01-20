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
  size(1280, 720);
  background(255);

  sin = new SinOsc(this);
  sqr = new SqrOsc(this);
  tri = new TriOsc(this);
  saw = new SawOsc(this);
  white = new WhiteNoise(this);

  String[] fileImport = loadStrings("input.txt");
  importProject(fileImport);  // imports a file called 'input.txt'
  
  playTrack();
}

void draw() {
  // GUI
  background(36, 36, 37);
  //fill()
  //rect();



  //sinTrack.playInstrument();
  //sqrTrack.playInstrument();
  
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
    Sample currSinSample = sinTrack.samples.get(currSin);
    
    if (currSinSample.beat == beat) {
      println("beat #" + beat + "\t", 
              "for", currSinSample.dur, "beats   \t",
              "SIN #" + currSin + "  \t", 
              currSinSample.note + Integer.toString(currSinSample.octave), "note (" + currSinSample.freq + "Hz)");
      currSinSample.playSound();
    } else if (currSinSample.beat + currSinSample.dur == beat) {
      currSinSample.stopSound();
      currSin++;
      println("currSin:", currSin);
    }
    //println("broken");
    
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
