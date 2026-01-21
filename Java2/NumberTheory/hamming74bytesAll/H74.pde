void getHash(int [] MX) {
  int pointer = 0;
  int [] mx = {0, 0, 0, 0};
  for (int i=0; i<= p; i++) { mx[i] = MX[i];  }
  while (pointer < k) {
    int x = mx[0];
    //println(pointer+ " A "+ mx[0] + " "+ mx[1] + " "+ mx[2]+ " "+ mx[3]);
    for(int i=0;i<p;i++) mx[i] = mx[i+1]^(x*gx[i+1]);  
    pointer++;
    if(pointer < k) mx[p] = MX[p + pointer];
    //println(pointer+ " B "+ mx[0] + " "+ mx[1] + " "+ mx[2]+ " "+ mx[3]);
  }
  for(int i=0;i<p;i++) MX[k+i] = mx[i];
}
