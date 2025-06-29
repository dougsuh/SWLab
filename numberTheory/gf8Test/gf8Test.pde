void setup(){
   GF8 gf = new GF8();

        int a = 0x3;
        int b = 0x2;
        
        System.out.println("a = " + gf.toHex(a));
        System.out.println("b = " + gf.toHex(b));
        System.out.println("a + b = " + gf.toHex(gf.add(a, b)));
        System.out.println("a * b = " + gf.toHex(gf.multiply(a, b)));
        System.out.println("a / b = " + gf.toHex(gf.divide(a, b)));
        System.out.println("inverse(b) = " + gf.toHex(gf.inverse(b)));
}
