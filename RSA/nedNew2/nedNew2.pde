int n,e,d,phi;
void setup(){
  int p,q;
  p = 31; q = 23;
  n = p*q;      phi = (p-1)*(q-1);
  println(" p= " + p +" q= " + q + " " + phi);
  findPublicKey();
}
int findPublicKey() {
  for (int i = 2; i < phi; i++) {
    if (gcd(i, phi) == 1) {   
      e = i;
      d = findPrivateKey();
      println(" e= " + e +" d= " + d +" n= " + n);
    }
  }
  return -1;
}
int findPrivateKey() {
  for (int m = 1; m < phi; m++) {
    if ((m * e) % phi == 1) { return m;   }
  }
  return -1;
}
int gcd(int x, int y){
    x = Math.abs(x);     y = Math.abs(y);
    while (y != 0) {
        int temp = y;
        y = x % y;
        x = temp;
    }
    return x;
}
