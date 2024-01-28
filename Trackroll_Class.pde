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
  void drawTracks() {
    for (int i=0; i<4; ++i) {
      Track currTrack = tracks.get(i);
      fill(255,133,133);
      stroke(0);
      //println(currTrack.totalBeatDuration());
      rect(0, i*trackHeight, currTrack.totalBeatDuration()*beatWidth, i*trackHeight+trackHeight);
    }
  }
}
