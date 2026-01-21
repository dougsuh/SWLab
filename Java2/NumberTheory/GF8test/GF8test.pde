void setup() {
  GF8 gf = new GF8(); // initialize GF8 table

  int a = 0x3;
  int b = 0x2;

  System.out.println("a = " + gf.toHex(a));
  System.out.println("b = " + gf.toHex(b));
  System.out.println("a + b = " + gf.toHex(gf.add(a, b)));
  System.out.println("a * b = " + gf.toHex(gf.multiply(a, b)));
  System.out.println("a / b = " + gf.toHex(gf.divide(a, b)));
  System.out.println("inverse(b) = " + gf.toHex(gf.inverse(b)));

  // solve  2x + 3y = 2
  //        x  + 6y = 3
  int [] xy =  gf.Eq2(2,3,2,1,6,3);
    println(xy[0] + " oooo " + xy[1]);
    // check
    println(gf.add(gf.multiply(2,xy[0]),gf.multiply(3,xy[1]))); 
    println(gf.add(gf.multiply(1,xy[0]),gf.multiply(6,xy[1])));
}
