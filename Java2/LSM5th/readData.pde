int readData(String filename,float [] x, float [] y){
  // Read data from text file
  String[] lines = loadStrings(filename);
  int n = lines.length;
  x = new float[n];
  y = new float[n];
  println(n);
  for (int i = 0; i < n; i++) {
    String[] parts = split(lines[i],' ');
    println(parts[0]+ " " + parts[1]);
    x[i] = float(parts[0]);
    y[i] = float(parts[1]);
  }
  return n;
}
