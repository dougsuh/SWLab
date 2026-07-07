float g = 9.81;
float m = 1.0;
float k = 0.35;
float t = 0;
float dt = 0.02;
float v = 0;
float y = 0;
float y0 = 500;  // originally 60
float scale = 6;
ArrayList<Float> ts = new ArrayList<Float>();
ArrayList<Float> vs = new ArrayList<Float>();

void setup() {
  size(900, 600);
  frameRate(60);
  textFont(createFont("Arial", 14));
}

void draw() {
  background(248);
  fill(20);
  text("1st-order DE for falling raindrop speed: dv/dt = g - (k/m)v", 20, 30);
  text("Using Euler method", 20, 52);

  if (y < y0) {
    float a = g - (k / m) * v;
    v += a * dt;
    y += v * dt;
    t += dt;
    ts.add(t);
    vs.add(v);
  }

  drawAxes();
  drawGraph();
  drawRaindrop();
  drawStats();
}

void drawAxes() {
  stroke(0);
  line(80, 540, 820, 540);
  line(80, 120, 80, 540);
  fill(0);
  text("time", 820, 560);
  text("speed", 20, 130);
}

void drawGraph() {
  noFill();
  stroke(30, 90, 200);
  beginShape();
  for (int i = 0; i < ts.size(); i++) {
    float px = map(ts.get(i), 0, max(5, t), 80, 820);
    float py = map(vs.get(i), 0, max(30, maxValue(vs)), 540, 120);
    vertex(px, py);
  }
  endShape();
}

void drawRaindrop() {
  float dropX = 700;
  float dropY = 120 + min(y, y0) * scale;
  noStroke();
  fill(60, 120, 255);
  ellipse(dropX, dropY, 24, 24);
  fill(0);
  text("raindrop", dropX - 20, dropY - 18);
}

void drawStats() {
  fill(0);
  text("t = " + nf(t, 1, 2) + " s", 20, 580);
  text("v = " + nf(v, 1, 3) + " m/s", 130, 580);
  text("y = " + nf(y, 1, 3) + " m", 250, 580);
  text("terminal speed approx = " + nf(m * g / k, 1, 3) + " m/s", 400, 580);
}

float maxValue(ArrayList<Float> vals) {
  float m = 1;
  for (float val : vals) {
    if (val > m) m = val;
  }
  return m;
}
