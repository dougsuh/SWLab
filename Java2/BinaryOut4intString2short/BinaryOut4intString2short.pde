import java.io.*;
void setup() {
  // Data to write
  int[] intArray = {10, 20, 30, 40, 50};
  String message = "I am a boy.";
  short[] shortArray = {100, 200, 300};  
  String filename = sketchPath("doug.dat"); // Output file (sketch folder)
  try {
    DataOutputStream out = new DataOutputStream(new FileOutputStream(filename));

    // Write 4 integers (4 bytes each)
    for (int i = 0; i < intArray.length; i++) {
      out.writeInt(intArray[i]);
    }

    // Write the string
    // writeUTF writes the length first, then the UTF-8 encoded string
    out.writeUTF(message);

    // Write 2 shorts (2 bytes each)
    for (int i = 0; i < shortArray.length; i++) {
      out.writeShort(shortArray[i]);
    }

    out.close();
    println("Binary file written successfully.");

  } catch (IOException e) {
    e.printStackTrace();
  }

  noLoop();
}
