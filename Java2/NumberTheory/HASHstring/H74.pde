void getHash(char [] MX) {
  int k = MX.length - p;  // number of data in byte
  int pointer = 0;
  char [] mx = {0, 0, 0, 0};
  for (int i=0; i<= p; i++) { mx[i] = MX[i];  }
  while (pointer < k) {
    char x = mx[0];
    //println(pointer+ " A "+ mx[0] + " "+ mx[1] + " "+ mx[2]+ " "+ mx[3]);
    for(int i=0;i<p;i++) mx[i] = (char)(mx[i+1]^(char)(x*gx[i+1]));  
    pointer++;
    if(pointer < k) mx[p] = MX[p + pointer];
    //println(pointer+ " B "+ mx[0] + " "+ mx[1] + " "+ mx[2]+ " "+ mx[3]);
  }
  for(int i=0;i<p;i++) MX[k+i] = mx[i];
}
int getHASHID(char [] hashedMX){
  int n = hashedMX.length;
  return (hashedMX[n-p] << 16) + (hashedMX[n-p+1] << 8) + hashedMX[n-p+2]; 
}
