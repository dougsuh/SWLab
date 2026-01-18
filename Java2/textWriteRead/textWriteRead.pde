void setup() {
  // Sample data to write
  int[] ages = {20, 25, 30, 35};
  float[] heights = {1.70, 1.75, 1.68, 1.80};
  // Write data to text file
  PrintWriter writer = createWriter("people.txt");
  for (int i = 0; i < ages.length; i++) {
    writer.println(ages[i] + " " + heights[i]);
  }
  writer.flush();
  writer.close();
  // Read data from text file
  String[] lines = loadStrings("people.txt");
  int [] rages = new int[lines.length];
  float [] rheights = new float[lines.length];
  for (int i = 0; i < lines.length; i++) {
    String[] parts = split(lines[i], ' ');
    rages[i] = int(parts[0]);
    rheights[i] = float(parts[1]);
  }
  // Print results to console
  for (int i = 0; i < rages.length; i++) {
    println("Age:", rages[i], "Height:", rheights[i]);
  }
  noLoop();
}
