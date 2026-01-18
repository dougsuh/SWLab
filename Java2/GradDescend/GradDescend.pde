void setup() {
  size(800, 800);
  
  // Parameters
  float x = 6.0;                    // Start far right [user query]
  float learningRate = 0.005;       // Step size
  int maxIters = 2000;
  
  float[] historyX = new float[maxIters];
  float[] historyY = new float[maxIters];
  
  // Gradient descent loop
  for (int i = 0; i < maxIters; i++) {
    float y = evalY(x);             // y = f(x)
    float grad = evalGrad(x);       // y' = f'(x) = 4x³ - 9x²
    
    x -= learningRate * grad;       // x_{n+1} = x_n - lr * ∇y
    
    historyX[i] = x;
    historyY[i] = y;
    
    if (abs(grad) < 0.001) {        // Convergence
      println("Converged at iteration " + i);
      break;
    }
  }
  
  println("Minimum at x = " + nf(x, 1, 3));
  println("y = " + nf(evalY(x), 1, 3));  // Should be ~ -1.688
  
  // Plot path
  stroke(255, 100, 0);
  strokeWeight(2);
  for (int i = 0; i < historyX.length-1; i++) {
    if (historyX[i] > 0) {
      line(map(historyX[i], 0, 6, 50, 750), 
           map(historyY[i], -2, 20, 350, 50),
           map(historyX[i+1], 0, 6, 50, 750), 
           map(historyY[i+1], -2, 20, 350, 50));
    }
  }
}

float evalY(float x) {
  return pow(x, 4) - 3*pow(x, 3) + 2;
}

float evalGrad(float x) {
  return 4*pow(x, 3) - 9*pow(x, 2);  // Analytical derivative
}

void draw() {
  background(240);
  
  // Plot function curve
  stroke(0, 100, 200);
  strokeWeight(2);
  noFill();
  beginShape();
  for (float px = 0; px <= 6; px += 0.02) {
    float py = evalY(px);
    vertex(map(px, 0, 6, 50, 750), map(py, -2, 20, 350, 50));
  }
  endShape();
  
  // Mark minimum
  float trueMinX = 2.25;
  stroke(255, 0, 0);
  strokeWeight(6);
  point(map(trueMinX, 0, 6, 50, 750), map(evalY(trueMinX), -2, 20, 350, 50));
  
  // Start and end points
  strokeWeight(10);
  stroke(0, 255, 0);  // Green: start
  point(map(6, 0, 6, 50, 750), map(evalY(6), -2, 20, 350, 50));
  
  fill(255);
  text("Start x=6 → Min x=2.25", 50, 30);
  text("Orange path: gradient descent", 50, 45);
}
