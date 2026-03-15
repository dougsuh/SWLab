import java.io.*;

short d = 287;
short n = 713;

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

        short c = fin.readShort();    // binary read
        short m = modPow(c);  // c^d mod n

        fout.writeByte(m);   // binary write
      }
    }
    catch (EOFException ex) {     }

    fin.close();
    fout.close();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
}

// m = c^d mod n
short modPow(short m) {
  int x = 1;
  for (int i=0; i<d; i++) x = (x*m) % n;
  return (short)x;
}
