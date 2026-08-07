// ============================================================
// Processing
// Draw a graph using x[] and y[] data
// ============================================================
float[] x;
float[] y;
int N = 100;
void setup() {
  size(800, 600);
  float dt = 0.01;
  x = new float [N];
  y = new float [N];
  for(int i=0;i<N;i++){
    x[i] = dt*i;
    y[i] = 2*exp(-2*x[i])*cos(2*PI*15*x[i]);
  }
}
void draw() {
  background(255);

  // Draw the graph using x and y arrays
  drawGraph(x, y);
}
