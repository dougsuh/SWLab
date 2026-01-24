// RSA encoder
int RSAencoder(int M){  
  int mm = 1;
  for (int i=0; i<e; i++) {
    mm *= M;
    mm %= n;
  }
  return mm;
}
// RSA decoder
int RSAdecoder(int C){  
  int mm = 1;
  for (int i=0; i<d; i++) {
    mm *= C;
    mm %= n;
  }
  return mm;
}
