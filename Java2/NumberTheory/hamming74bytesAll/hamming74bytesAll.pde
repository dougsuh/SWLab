int [] gx = {1, 0, 1, 1};
int p = 3;  // degree of the generator polynomial
int k = 4;  // number of data in byte
void setup() {
  int [] MX = new int[p+k]; // data + p blank
  for(int i=0;i<16;i++){
      int mask = 1;
      for(int j=0;j<4;j++,mask*=2){
          if((i & mask) != 0) MX[3-j] = 1; else MX[3-j] = 0;          
      }
      MX[4] = MX[5] = MX[6] = 0;
      getHash(MX);
      for(int j=0;j<k+p;j++) print(MX[j]+" "); println();
      // check
      getHash(MX);
      for(int j=0;j<k+p;j++) print(MX[j]+" "); println();
  }
}
