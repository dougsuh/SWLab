import java.math.BigInteger;
import java.io.*;

BigInteger d = new BigInteger("2753");
BigInteger n = new BigInteger("3233");

void setup() {
  String ss = "entest.txt";
  decryptFile(ss, ss.substring(2));

  println("Decryption finished.");
  exit();
}
//  each int --> a char
void decryptFile(String inputFile, String outputFile) {

  try {

    DataInputStream fin =
      new DataInputStream(new FileInputStream(sketchPath(inputFile)));

    DataOutputStream fout =
      new DataOutputStream(new FileOutputStream(sketchPath(outputFile)));

    try {
      while (true) {

        int c = fin.readInt();    // binary read

        BigInteger C = BigInteger.valueOf(c);
        BigInteger m = C.modPow(d, n);  // C^d mod n

        fout.writeByte(m.intValue());   // binary write
      }
    }
    catch (EOFException ex) {
    }

    fin.close();
    fout.close();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
}
