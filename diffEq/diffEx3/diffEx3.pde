// Processing 4
// Compare analytical and numerical derivatives of x^n

int n = 5;                 // exponent
float xmin = -2;
float xmax = 2;
float dx = 0.0001f;        // step for numerical derivative

void setup() {
  size(900, 600);

  println("    x\tAnalytic\tNumeric\t\tError");
  println("-----------------------------------------------------");

  for (float x = xmin; x <= xmax; x += 0.2) {
    float a = analyticDerivative(x);
    float num = numericalDerivative(x);
    float err = abs(a - num);

    println(nf(x,1,2) + "\t"
      + nf(a,1,6) + "\t"
      + nf(num,1,6) + "\t"
      + nf(err,1,8));
  }

  noLoop();
}

void draw() {
  background(255);

  drawAxes();

  // Analytical derivative (blue)
  stroke(0,0,255);
  strokeWeight(2);
  drawFunction(true);

  // Numerical derivative (red)
  stroke(255,0,0);
  strokeWeight(1);
  drawFunction(false);

  fill(0);
  text("Blue : analytical",20,20);
  fill(255,0,0);
  text("Red : numerical",20,40);
}

//------------------------------------------
// Original function
//------------------------------------------
float f(float x) {
  return pow(x, n);
}

//------------------------------------------
// Analytical derivative
//------------------------------------------
float analyticDerivative(float x) {
  return n * pow(x, n-1);
}

//------------------------------------------
// Numerical derivative
// Central Difference
//------------------------------------------
float numericalDerivative(float x) {
  return (f(x + dx) - f(x - dx)) / (2 * dx);
}
