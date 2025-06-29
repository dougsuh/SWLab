//  Test Crammer's rule
//   [a b][x] = [c]
//   [d e][y] = [f]
void setup() {
  GF256 gf = new GF256();
  int a = 0x53, b = 0x1a, c = 0xA, d = 0xC3, e = 0x3A, f = 0xE1;
  int n, x, y, nx, ny;
  n = gf.add(gf.multiply(a, e), gf.multiply(d, b));
  nx = gf.add(gf.multiply(b, f), gf.multiply(c, e));
  ny = gf.add(gf.multiply(a, f), gf.multiply(c, d));
  x = gf.divide(nx, n);
  y = gf.divide(ny, n);
  System.out.println();
  System.out.println();
  System.out.println("c = " + gf.toHex(c));
  System.out.println("f = " + gf.toHex(f));

  System.out.println("x = " + gf.toHex(x));
  System.out.println("y = " + gf.toHex(y));
  nx = gf.add(gf.multiply(a, x), gf.multiply(b, y));
  ny = gf.add(gf.multiply(d, x), gf.multiply(e, y));
  System.out.println("c = " + gf.toHex(nx));
  System.out.println("f = " + gf.toHex(ny));
}
