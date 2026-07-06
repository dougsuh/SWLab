//------------------------------------------
void drawFunction(boolean analytic) {
  boolean first = true;
  beginShape();
  for (float x=xmin; x<=xmax; x+=0.01) {
    float y;
    if (analytic)
      y = analyticDerivative(x);
    else
      y = numericalDerivative(x);

    float sx = map(x, xmin, xmax, 50, width-50);

    // vertical scaling
    float sy = map(y, -20, 20, height-50, 50);

    if (first) {
      vertex(sx, sy);
      first = false;
    } else {
      vertex(sx, sy);
    }
  }
  endShape();
}

//------------------------------------------
void drawAxes() {
  stroke(150);
  // x-axis
  line(50, height/2, width-50, height/2);
  // y-axis
  line(width/2, 50, width/2, height-50);
}
