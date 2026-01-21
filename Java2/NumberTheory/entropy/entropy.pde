// Entropy calculator in Processing
// Shannon entropy: H = -sum(p_i * log2(p_i))
float[] probs = {0.25,0.25,0.25,0.25}; 
void setup() {
  float entropy = calculateEntropy(probs);
  println("entropy = " + " " + entropy);
}
// Compute Shannon entropy in bits for a discrete distribution
float calculateEntropy(float[] p) {
  float H = 0;
  for (int i = 0; i < p.length; i++) {
    if (p[i] > 0) { H -= p[i] * (log(p[i]) / log(2)); }// change of base formula for log2
  }
  return H;
}
