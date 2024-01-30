class Trackroll {
  // fields
  ArrayList<Track> tracks = new ArrayList<Track>();
  float trackHeight = 50;
  
    
  // constructor
  Trackroll() {
    tracks.add(sinTrack);
    tracks.add(triTrack);
    tracks.add(sqrTrack);
    tracks.add(sawTrack);
  }
  
  
  // methods
  void drawTrackroll() {
    noStroke();
    
    for (int i=0; i<4; ++i) {
      Track currTrack = tracks.get(i);
      String text = "SIN";

      if (i == 0) {
        fill(0xcceb4f65);
      } else if (i == 1) {
        fill(0xcc1061af);
        text = "TRI";
      } else if (i == 2) {
        fill(0xcc4fb44b);
        text = "SQR";
      } else if (i == 3) {
        fill(0xccf6d03e);
        text = "SAW";
      }
      rect(0, i*trackHeight, keyWidth+currTrack.totalBeatDuration()*beatWidth, trackHeight);
      
      fill(255);
      text(text, keyWidth/2, i*beatWidth+33);
    }
  }
}
