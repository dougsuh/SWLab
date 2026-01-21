// Pseudo_HASH using BCH(31,16,t=7) px=(107657)8=0x8FAF
// input: n-bytes long string
// output : 2 bytes long HASH 
void setup() {
 test();
 hashTest();
 int hash = getHash("I am that I am.");
 println(" HASH " + String.format("0x%4X", hash));
}
