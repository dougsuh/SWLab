void test(){
  int C,R,r,L;
  // shift left
  C = 0xf800;
  C = C << 16;
  println(C + " " + String.format("0x%8X", C));
  // Test 1 : negative integer bit operation
  C = -1;
  R = -5000;
  println(C + " " + String.format("0x%8X", C));
  println(R + " " + String.format("0x%8X", R));
  println(" C ^ R " + String.format("0x%8X", C^R));
  println(" C & R " + String.format("0x%8X", C&R));
  // Test 2 : string and char array
  String digitalFile = "I am that I am.";
  L = digitalFile.length();
  println(" File length = " + L + "bytes");
  char [] dFile = digitalFile.toCharArray();
  printCharArray(dFile);
  // Test 3: error injection
  dFile[5] = 'E'; // error injection
  printCharArray(dFile);
  // char --> int
  char [] cc;
  cc = new char[4];
  cc[0] = 0xf0;
  cc[1] = 0x28;
  cc[2] = 0x81;
  cc[3] = 0xab;
  C = char2int(cc);
  println(String.format("0x%8X", C));
  // test char2int
  int a,b,c;
  a = char2int(cc,0);
  b = a<<16;
  b |= char2int(cc,2);  
  println(" a = " + String.format("0x%8X", a));
  println(" b = " + String.format("0x%8X", b));
}
