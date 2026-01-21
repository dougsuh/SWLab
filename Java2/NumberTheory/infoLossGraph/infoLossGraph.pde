// BSC Information Loss Plotter (Binary Entropy H(p))
// Information loss per bit = H(p) = -p*log2(p) - (1-p)*log2(1-p)

void setup() {
  size(800, 500);
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();
  
  // Plot H(p) for p from 0 to 1
  beginShape();
  for (float p = 0; p <= 1.0; p += 0.001) {
    float h = binaryEntropy(p);
    float x = map(p, 0, 1, 50, width-50);
    float y = map(h, 0, 1, height-50, 50);
    vertex(x, y);
  }
  endShape();
  
  // Draw axes
  stroke(100);
  strokeWeight(1);
  line(50, 50, 50, height-50);   // Y-axis
  line(50, height-50, width-50, height-50); // X-axis
  
  // Labels
  fill(0);
  textSize(14);
  text("BER p (Bit Error Rate)", width/2, height-20);
  pushMatrix();
  translate(20, height/2);
  rotate(-PI/2);
  text("Information Loss H(p) [bits/bit]", 0, 0);
  popMatrix();
  
  // Key points
  text("Max loss=1 bit at p=0.5", 60, 80);
  text("No loss at p=0,1", 60, height-80);
}

float binaryEntropy(float p) {
  if (p <= 0 || p >= 1) return 0;
  return -p * log(p)/log(2) - (1-p) * log(1-p)/log(2);
}
