// Find e such that gcd(e, phi) == 1
int findPublicKey(int phi) {
  for (int i = 2; i < phi; i++) {
    if (gcd(i, phi) == 1) {
      return i;
    }
  }
  return -1;
}

// Find d such that (d * e) mod phi == 1
int findPrivateKey(int e, int phi) {
  for (int i = 1; i < phi; i++) {
    if ((i * e) % phi == 1) {
      return i;
    }
  }
  return -1;
}
// Euclidean algorithm
int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}
