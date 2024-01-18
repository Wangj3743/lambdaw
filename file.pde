void importProject(String[] fileImport) {
  int indexMETA = 0;
  int indexSCORE = 0;
  int indexSINE = 0;
  int indexSQUARE = 0;
  int indexTRIANGLE = 0;
  int indexSAW = 0;
  
  for (int i=0; i<fileImport.length; ++i) {              // switch to binary search!!!!!!
    if (fileImport[i].equals("# META")) 
      indexMETA = i;
    else if (fileImport[i].equals("# SCORE"))
      indexSCORE = i;
  }
  
  
  for (int i=indexSCORE+2; i<33; ++i) {            // fix the ending cond. do it for sqr, tri, saw with nested
    String curr = fileImport[i];
    int[] commas = findCommas(curr, 3);
    
    String s = "sine";                                    // source
    float a = float(curr.substring(0, commas[0]));        // amplitude
    int d = int(curr.substring(commas[0]+2, commas[1]));  // duration
    String n = curr.substring(commas[1]+2, commas[2]);  // note
    int o = int(curr.substring(commas[2]+2, curr.length()));  // octave
    
    sineTrack.samples.add(new Sample(s, a, d, n, o));
  }
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
