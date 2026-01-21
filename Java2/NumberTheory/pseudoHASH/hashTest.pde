void hashTest() {
  // hash test
  println("////// HASH test /////");
  char [] cc;
  int hash;
  cc = new char[4];
  cc[0] = (char)((0x8FAF & 0xFF00) >> 8);
  cc[1] = (char)(0x8FAF & 0xFF);
  cc[2] = (char)((0x8FAF & 0xFF00) >> 8);
  cc[3] = (char)(0x8FAF & 0xFF);
  printCharArray(cc);
  println(String.format("0x%4X", c2int(cc[2])) + "  "
    + String.format("0x%4X", c2int(cc[3])) );
  int ic = char2int(cc, 0);
  ic <<= 16;
  ic |= char2int(cc, 2);
  println(" message " + String.format("0x%4X", ic));
  hash = getHash(cc);
  println(" HASH " + String.format("0x%8X", hash));
  println("////// end of HASH test /////");
}
