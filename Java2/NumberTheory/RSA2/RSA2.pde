// encode and decode 2 random numbers 704 and 1115
// range of one digit 2537 < 2^11
// RSA key generation using p = 7, q = 19
// Educational example (small numbers)
int p = 61;
int q = 53;
int n;        // modulus
int phi;      // Euler's totient
int e;        // public exponent
int d;        // private exponent

void setup() {
  n = p * q;
  phi = (p - 1) * (q - 1);

  e = findPublicKey(phi);
  d = findPrivateKey(e, phi);

  println("p =", p);
  println("q =", q);
  println("n =", n);
  println("phi =", phi);

  println("\nPublic Key (e, n) = (" + e + ", " + n + ")");
  println("Private Key (d, n) = (" + d + ", " + n + ")");
  int c1,c2;
  // RSA encoder
  println("encoding 2500, 1115...");
  c1 = RSAencoder(2500);
  c2 = RSAencoder(1115); 
  println("encrypted: " + c1 + " " + c2);
  // RSA decoder
  println("decoding...");
  println(RSAdecoder(c1));
  println(RSAdecoder(c2));
}
