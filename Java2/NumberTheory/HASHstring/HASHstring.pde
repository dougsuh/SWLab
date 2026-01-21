// Jan. 20, 2026
// This program shows that HASH can be used as ID.
char [] gx = {1, 0, 1, 1};
int p = 3;  // degree of the generator polynomial
void setup() {
  char [] MX;
  String [] MXs = { "I am a boy", "This is a pen", "I am so happy", "This is a pen"};
  for (int n=0; n<MXs.length; n++) {
    MX = MXs[n].toCharArray();
    char [] MXHASH = new char[MX.length+p];
    for (int i=0; i<MXHASH.length; i++)
      if (i<MX.length) MXHASH[i] = MX[i];
      else MXHASH[i] = 0;
    getHash(MXHASH);
    String hashed = new String(MXHASH);
    println(hashed + " " + getHASHID(MXHASH));
    // check
    getHash(MXHASH);
    String dehashed = new String(MXHASH);
    println(dehashed + " " + getHASHID(MXHASH));
  }
}
