/*import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;*/
import java.io.*;
void setup() {
  // Arrays to write
  int[] intArray = {10, 20, 30, 40};
  short[] shortArray = {100, 200};
  // File will be created in the sketch folder
  String filename = sketchPath("data.bin");
  try {
    DataOutputStream out = new DataOutputStream(new FileOutputStream(filename));
    // Write 4 integers (each 4 bytes)
    for (int i = 0; i < intArray.length; i++) { out.writeInt(intArray[i]);   }
    // Write 2 shorts (each 2 bytes)
    for (int i = 0; i < shortArray.length; i++) { out.writeShort(shortArray[i]);  }
    out.close();
    println("Binary file written successfully.");
  } catch (IOException e) {    e.printStackTrace();  }
  noLoop();
}
