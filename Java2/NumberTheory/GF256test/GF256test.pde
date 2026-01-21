void setup() {
  GF256 gf = new GF256();

  int a = 0x53;
  int b = 0xCA;

  System.out.println("a = " + gf.toHex(a));
  System.out.println("b = " + gf.toHex(b));
  System.out.println("a + b = " + gf.toHex(gf.add(a, b)));
  System.out.println("a * b = " + gf.toHex(gf.multiply(a, b)));
  System.out.println("a / b = " + gf.toHex(gf.divide(a, b)));
  System.out.println("inverse(b) = " + gf.toHex(gf.inverse(b)));
  // solve  2x + 3y = 2
  //        x  + 6y = 3
  int [] xy =  gf.Eq2(2, 3, 2, 1, 6, 3);
  println(xy[0] + " " + xy[1]);
  // check
  println(gf.add(gf.multiply(2, xy[0]), gf.multiply(3, xy[1])));
  println(gf.add(gf.multiply(1, xy[0]), gf.multiply(6, xy[1])));
  xy = gf.Eq2(17, 6, 212, 54, 3, 30);
  println(xy[0] + " " + xy[1]);
  // check
  println(gf.add(gf.multiply(17, xy[0]), gf.multiply(6, xy[1])));
  println(gf.add(gf.multiply(54, xy[0]), gf.multiply(3, xy[1])));
  
  xy = gf.Eq2(77, 126, 12, 5, 203, 31);
  println(xy[0] + " " + xy[1]);
  // check
  println(gf.add(gf.multiply(77, xy[0]), gf.multiply(126, xy[1])));
  println(gf.add(gf.multiply(5, xy[0]), gf.multiply(203, xy[1])));
}
