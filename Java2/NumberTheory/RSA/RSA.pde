// encode and decode 2 random numbers 704 and 1115
// range of one digit 2537 < 2^11
int e, n, d, c1, c2;
void setup() {
  e = 13;
  n = 2537;   
  d = 937;
  // confirm RSA requirements
  int i=5,p,q,T;
  while((n % ++i) != 0){}
  p=i; q=n/p;
  println(" p = ",i," q = ",q," n= ",p*q);
  T = (p-1)*(q-1);
  println(((e*d) % T)+" = 1");
 
  // RSA encoder
  println("encoding...");
  c1 = RSAencoder(2500);
  c2 = RSAencoder(1115);  
  // RSA decoder
  println("decoding...");
  println(RSAdecoder(c1));
  println(RSAdecoder(c2));
}
// RSA encoder
int RSAencoder(int M){  
  int mm = 1;
  for (int i=0; i<e; i++) {
    mm *= M;
    mm %= n;
  }
  return mm;
}
// RSA encoder
int RSAdecoder(int C){  
  int mm = 1;
  for (int i=0; i<d; i++) {
    mm *= C;
    mm %= n;
  }
  return mm;
}
