import java.io.DataInputStream;
import java.io.InputStream;
import java.io.IOException;

int[] intArray = new int[4];
String textString = "";
short[] shortArray = new short[2];

void setup() {
  size(400, 200);
  try {
    // Read doug.dat from the "data" folder of the sketch
    InputStream is = createInput("doug.dat");
    if (is == null) {
      println("Could not find doug.dat in the data folder.");
      exit();
    }
    DataInputStream dis = new DataInputStream(is);
    // ---- read 4 integers ----
    for (int i = 0; i < 4; i++) {       intArray[i] = dis.readInt();     }
    // ---- read UTF string ----
    textString = dis.readUTF();
    // ---- read 2 shorts ----
    for (int i = 0; i < 2; i++) {      shortArray[i] = dis.readShort();  }
    dis.close();
    // Print results to console
    println("Integers:");
    for (int i = 0; i < 4; i++) println("  " + intArray[i]);
    println("String:");
    println("  " + textString);
    println("Shorts:");
    for (int i = 0; i < 2; i++) println("  " + shortArray[i]);
  } catch (IOException e) {
    e.printStackTrace();
  }
}
void draw() {
  background(240);
  text("Check console for data read from doug.dat", 20, 100);
}
