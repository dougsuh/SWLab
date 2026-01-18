import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;

void setup() {
  int[] intArray = new int[4];
  short[] shortArray = new short[2];

  // File must be in the sketch folder
  String filename = sketchPath("data.bin");

  try {
    DataInputStream in = new DataInputStream(new FileInputStream(filename));

    // Read 4 integers
    for (int i = 0; i < intArray.length; i++) {
      intArray[i] = in.readInt();
    }

    // Read 2 shorts
    for (int i = 0; i < shortArray.length; i++) {
      shortArray[i] = in.readShort();
    }

    in.close();

    // Print values to verify
    println("Integers:");
    for (int v : intArray) {
      println(v);
    }

    println("Shorts:");
    for (short v : shortArray) {
      println(v);
    }

  } catch (IOException e) {
    e.printStackTrace();
  }

  noLoop();
}
