// 2 byte | int
int c2int(char c){
    if(c<0) return (256+(int)c);
    else return((int)c);  
}
int char2int(char [] ccc,int start){
  int c,j,cc; 
  j = 256;
  cc = 0;
  for(int i=0;i<2;i++,j/=256){
    if(ccc[start+i]<0) c = 256+(int)ccc[i];
    else c = (int)ccc[start+i];
    cc |= c*j;
  }
  return cc;
}
// 4 bytes char --> an int
int char2int(char [] ccc){
  int c,j,cc; 
  j = 1;
  cc = 0;
  for(int i=3;i>-1;i--,j<<=8){
    if(ccc[i]<0) c = 256+(int)ccc[i];
    else c = (int)ccc[i];
    cc |= c*j;
  }
  return cc;
}
void printCharArray(char [] cc){
  int L = cc.length;
  println(" char array length = " + L+ "bytes");
  for(int i=0;i<L;i++){
    print(String.format("%2X",c2int(cc[i])));
  } 
  print("\n");
}
