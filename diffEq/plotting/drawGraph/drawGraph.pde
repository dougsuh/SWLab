// ============================================================
// Processing
// Draw a graph using x[] and y[] data
// ============================================================

float[] x = {
  10, 20, 35, 50, 65, 80, 100
};
float[] y = {
  120, 180, 150, 260, 220, 310, 280
};
void setup() {
  size(800, 600);
}
void draw() {
  background(255);

  // Draw the graph using x and y arrays
  drawGraph(x, y);
}
