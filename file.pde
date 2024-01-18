void importProject(String[] fileImport) {
  int indexMETA = 0;
  int indexSCORE = 0;
  int indexSINE = 0;
  int indexSQUARE = 0;
  int indexTRIANGLE = 0;
  int indexSAW = 0;
  
  // find index of titles
  for (int i=0; i<fileImport.length; ++i) {              // switch to binary search!!!!!!
    if (fileImport[i].equals("# META")) 
      indexMETA = i;
    else if (fileImport[i].equals("# SCORE"))
      indexSCORE = i;
    else if (fileImport[i].equals("## SINE"))
      indexSINE = i;
    else if (fileImport[i].equals("## SQUARE"))
      indexSQUARE = i;
    else if (fileImport[i].equals("## TRIANGLE"))
      indexTRIANGLE = i;
    else if (fileImport[i].equals("## SAW"))
      indexSAW = i;
  }
  
  // import waveforms
  importWaveform(fileImport, "sine", indexSINE, indexSQUARE);
  importWaveform(fileImport, "square", indexSQUARE, indexTRIANGLE);
  importWaveform(fileImport, "triangle", indexTRIANGLE, indexSAW);
  importWaveform(fileImport, "saw", indexSAW, fileImport.length);
}


void exportProject() {
  
}


void recordProject() {
  
}


int[] findCommas(String curr, int numPara) {             // account for other constructor!!!!
  int[] commas = new int[numPara];
  
  for (int j=0; j<numPara; ++j) {
    if (j == 0) {
      commas[j] = curr.indexOf(",");
    }
    else {
      commas[j] = curr.indexOf(", ", commas[j-1]+1);
    }
  }
  return commas;
}


void importWaveform(String[] fileImport, String waveForm, int index1, int index2) {
    for (int j=index1+1; j<index2-1; ++j) {
      String curr = fileImport[j];
      int[] commas = findCommas(curr, 4);
      String s = waveForm;                                      // source
      float a = float(curr.substring(0, commas[0]));            // amplitude
      float b = float(curr.substring(commas[0]+2, commas[1]));  // beginning beat
      float d = int(curr.substring(commas[1]+2, commas[2]));    // duration
      String n = curr.substring(commas[2]+2, commas[3]);        // note
      int o = int(curr.substring(commas[3]+2, curr.length()));  // octave
      println(s, a, b, d, n, o);
      if (s.equals("sine"))
        sinTrack.samples.add(new Sample(s, a, b, d, n, o));
      else if (s.equals("square"))
        sqrTrack.samples.add(new Sample(s, a, b, d, n, o));
      else if (s.equals("triangle"))
        triTrack.samples.add(new Sample(s, a, b, d, n, o));
      else if (s.equals("saw"))
        sawTrack.samples.add(new Sample(s, a, b, d, n, o));
    }
}
