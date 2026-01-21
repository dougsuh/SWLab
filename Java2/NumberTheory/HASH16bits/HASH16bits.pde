// Pseudo_HASH using BCH(31,16,t=7) px=(107657)8=0x8FAF
// input: n-bytes long string
// output : (n+2) bytes long string 
//          where the last 2bytes are parity bits.
void setup() {
  int C,R,r,L;
  String digitalFile = "I am that I am.";
  L = digitalFile.length();
  println(" File length = " + L);
  char [] dFile = digitalFile.toCharArray();
  L = dFile.length;
  println(" char array length = " + L);
  for(int i=0;i<L;i++){
    print(dFile[i]);
  } 
  print("\n");
  dFile[4] = 'E';
  String Corrupted = new String(dFile);
  println(Corrupted);
  // symptom of 1 bit error
  for(R = 1;R < 0x4001; R*=2){
    r = remainder(R);
    print(String.format("0x%04X  ", R));
    println(String.format("0x%01X", r));
  }
}
// M*2^(n-k) + (M*2^(n-k) % px) 
int HammingEncode(int m){ 
  int cc = remainder(m*16); // 16 = 2^(n-k)
  cc += m*16;
  return cc;
}
// remainder = m % px
int remainder(int m) {
  int px = 0x19*1024;  // 1 1001 << 10
  int mask = 0x4000; // 100 0000 0000 0000
  int cc;
  cc = m;
  for(int i=0;i<11;i++){
    if((mask & cc) != 0){
      cc ^= px;
    }
    px /= 2;
    mask /=2;
  }
  return cc;
}
