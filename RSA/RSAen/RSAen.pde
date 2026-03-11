import java.math.BigInteger;
import java.io.*;

BigInteger e = new BigInteger("17");
BigInteger n = new BigInteger("3233");

void setup() {
  
  encryptFile("test.txt", "en"+"test.txt");

  println("Encryption finished.");
  exit();
}
// each char --> int
void encryptFile(String inputFile, String outputFile) {

  try {

    DataInputStream fin =
      new DataInputStream(new FileInputStream(sketchPath(inputFile)));

    DataOutputStream fout =
      new DataOutputStream(new FileOutputStream(sketchPath(outputFile)));

    try {
      while (true) {

        int mByte = fin.readUnsignedByte();   // binary read

        BigInteger m = BigInteger.valueOf(mByte);
        BigInteger c = m.modPow(e, n);        // RSA encryption

        fout.writeInt(c.intValue());          // binary write
      }
    }
    catch (EOFException ex) {
      // end of file
    }

    fin.close();
    fout.close();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
}
