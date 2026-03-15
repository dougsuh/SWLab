import java.io.*;

short e = 23; // d = 287
short n = 713;

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

        short m = (short)mByte;
        short c = modPow(m);        // RSA encryption

        fout.writeShort(c);          // binary write
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
// c = m^e mod n
short modPow(short m) {
  int x = 1;
  for (int i=0; i<e; i++) x = (x*m) % n;
  return (short)x;
}
