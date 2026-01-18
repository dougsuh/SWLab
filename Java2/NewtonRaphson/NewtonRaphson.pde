void setup() {
  size(800, 400);
  
  // Test two starting points to find both roots
  println("=== Newton-Raphson for f(x) = (x+3)(x-1) ===");
  
  findRoot(-4.0, "Left root (start x=-4)");   // Finds x=-3
  findRoot(0.0,  "Right root (start x=0)");   // Finds x=1
  
  noLoop();
}

void findRoot(float x0, String label) {
  float x = x0;
  float tolerance = 1e-6;
  int maxIters = 50;
  boolean converged = false;
  
  println("\n" + label);
  for (int i = 0; i < maxIters; i++) {
    float fx = evalF(x);
    float dfx = evalDF(x);  // f'(x) = 2x + 2
    
    if (abs(dfx) < 1e-10) {
      println("Derivative zero - bad start");
      break;
    }
    
    float x_new = x - fx / dfx;  // Newton update: x_{n+1} = x_n - f(x)/f'(x)
    
    println("Iter " + i + ": x=" + nf(x, 1, 6) + 
            ", f(x)=" + nf(fx, 1, 6) + 
            " → " + nf(x_new, 1, 6));
    
    if (abs(x_new - x) < tolerance) {
      converged = true;
      println("√ ROOT: x = " + nf(x_new, 1, 6));
      break;
    }
    x = x_new;
  }
  if (!converged) println("Did not converge");
}

float evalF(float x) {
  return (x + 3) * (x - 1);  // x² + 2x - 3
}

float evalDF(float x) {
  return 2*x + 2;  // Derivative
}

void draw() {
  background(240);
  
  // Plot f(x)
  stroke(0, 100, 200);
  strokeWeight(2);
  for (float px = -5; px <= 3; px += 0.05) {
    float py = evalF(px);
    if (abs(py) < 20) {  // Clip for display
      line(map(px, -5, 3, 50, 750), map(evalF(px-0.05), -10, 10, 350, 50),
           map(px, -5, 3, 50, 750), map(py, -10, 10, 350, 50));
    }
  }
  
  // Roots
  strokeWeight(8);
  stroke(255, 0, 0);
  point(map(-3, -5, 3, 50, 750), map(0, -10, 10, 350, 50));
  point(map(1, -5, 3, 50, 750), map(0, -10, 10, 350, 50));
  
  fill(255);
  text("Roots: x=-3, x=1", 50, 30);
  text("Blue: f(x), Red dots: roots", 50, 45);
}
