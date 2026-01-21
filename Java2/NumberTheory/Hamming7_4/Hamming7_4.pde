// Hamming (7, 4) code with px = 1101
void setup() {
  int C,R,r;
  //  Hamming (7, 4) code for the message M
  for (int M=0; M<16; M++) {
    C = HammingEncode(M);
    println(String.format("0x%08X", C));
  }
  // symptom of 1 bit error
  for(R = 1;R < 0x68; R*=2){
    r = remainder(R);
    print(String.format("0x%08X  ", R));
    println(String.format("0x%08X", r));
  }
}
// M*2^(n-k) + (M*2^(n-k) % px) 
int HammingEncode(int m){ 
  int cc = remainder(m*8);
  cc += m*8;
  return cc;
}
// remainder = m % px
int remainder(int m) {
  int px = 0xd*8;  // 1101 000
  int mask = 0x40; // 100 0000
  int cc;
  cc = m;
  for(int i=0;i<4;i++){
    if((mask & cc) != 0){
      cc ^= px;
    }
    px /= 2;
    mask /=2;
  }
  return cc;
}
