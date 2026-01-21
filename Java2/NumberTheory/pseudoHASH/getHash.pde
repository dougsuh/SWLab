// BCH(31,16,t=7) px=(107657)8=0x8FAF
int getHash(String digitalFile) {
  char [] dFile = digitalFile.toCharArray();
  return getHash(dFile);
}
int getHash(char [] dFile) {
  int register = 0, start, L;
  L = dFile.length;
  char [] cd;
  cd = new char[2];
  // the 1st 4byte
  if ((L % 2)==0) {  // length of even number
    register = char2int(dFile, 0);
    start = 2;
  } else { // odd number byte long file
    cd[0] = 0;
    cd[1] = dFile[0];
    register = char2int(cd, 0);
    start = 1;
  }
  for (int at = start; at<L; at+=2) {
    register = register << 16;
    register |= char2int(dFile, at);
    register = remainder(register);
  }
  // last 2 bytes
    register = register << 16;
    cd[0] = cd[1] = 0;
    register |= char2int(cd,0);
    register = remainder(register);
  return register;
}
// remainder = m % px
int remainder(int m) {
  int px = 0x8FAF0000;  // 0x8FAF << 16
  int mask = 0x80000000;
  int cc;
  cc = m;
  for (int i=0; i<16; i++) {
    if ((mask & cc) != 0) {
      cc ^= px;
    }
    px /= 2;
    mask /=2;
  }
  return cc;
}
