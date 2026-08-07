// ============================================================
// Function to draw a graph from x[] and y[]
// ============================================================

void drawGraph(float[] x, float[] y) {

  // Check whether the data arrays are valid
  if (x == null || y == null) {
    return;
  }

  // x and y arrays must have the same length
  if (x.length != y.length) {
    println("Error: x and y arrays must have the same length.");
    return;
  }

  // Check for empty arrays
  if (x.length == 0) {
    return;
  }


  // ----------------------------------------------------------
  // Define the graph area
  // ----------------------------------------------------------

  float left   = 80;
  float right  = width - 40;
  float top    = 50;
  float bottom = height - 70;


  // ----------------------------------------------------------
  // Find the minimum and maximum values of x and y
  // ----------------------------------------------------------

  float xMin = x[0];
  float xMax = x[0];

  float yMin = y[0];
  float yMax = y[0];


  for (int i = 1; i < x.length; i++) {

    if (x[i] < xMin) {
      xMin = x[i];
    }

    if (x[i] > xMax) {
      xMax = x[i];
    }

    if (y[i] < yMin) {
      yMin = y[i];
    }

    if (y[i] > yMax) {
      yMax = y[i];
    }
  }


  // Prevent a zero range when all values are identical
  if (xMin == xMax) {
    xMin -= 1;
    xMax += 1;
  }

  if (yMin == yMax) {
    yMin -= 1;
    yMax += 1;
  }


  // ----------------------------------------------------------
  // Draw the graph background
  // ----------------------------------------------------------

  noStroke();
  fill(245);

  rect(
    left,
    top,
    right - left,
    bottom - top
  );


  // ----------------------------------------------------------
  // Draw the grid
  // ----------------------------------------------------------

  stroke(220);
  strokeWeight(1);

  int gridCount = 10;

  // Draw vertical grid lines
  for (int i = 0; i <= gridCount; i++) {

    float sx = map(
      i,
      0,
      gridCount,
      left,
      right
    );

    line(
      sx,
      top,
      sx,
      bottom
    );
  }


  // Draw horizontal grid lines
  for (int i = 0; i <= gridCount; i++) {

    float sy = map(
      i,
      0,
      gridCount,
      bottom,
      top
    );

    line(
      left,
      sy,
      right,
      sy
    );
  }


  // ----------------------------------------------------------
  // Draw the graph border
  // ----------------------------------------------------------

  stroke(80);
  strokeWeight(2);
  noFill();

  rect(
    left,
    top,
    right - left,
    bottom - top
  );


  // ----------------------------------------------------------
  // Connect the data points
  // ----------------------------------------------------------

  stroke(0, 100, 255);
  strokeWeight(3);
  noFill();

  beginShape();

  for (int i = 0; i < x.length; i++) {

    // Convert data coordinates to screen coordinates
    float sx = map(
      x[i],
      xMin,
      xMax,
      left,
      right
    );

    float sy = map(
      y[i],
      yMin,
      yMax,
      bottom,
      top
    );

    vertex(sx, sy);
  }

  endShape();


  // ----------------------------------------------------------
  // Draw the data points
  // ----------------------------------------------------------

  fill(255, 50, 50);
  noStroke();

  for (int i = 0; i < x.length; i++) {

    float sx = map(
      x[i],
      xMin,
      xMax,
      left,
      right
    );

    float sy = map(
      y[i],
      yMin,
      yMax,
      bottom,
      top
    );

    ellipse(sx, sy, 8, 8);
  }


  // ----------------------------------------------------------
  // Display minimum and maximum values
  // ----------------------------------------------------------

  fill(50);
  textSize(12);

  // Display X-axis minimum and maximum values
  textAlign(CENTER, TOP);

  text(
    nf(xMin, 0, 2),
    left,
    bottom + 10
  );

  text(
    nf(xMax, 0, 2),
    right,
    bottom + 10
  );


  // Display Y-axis minimum and maximum values
  textAlign(RIGHT, CENTER);

  text(
    nf(yMin, 0, 2),
    left - 10,
    bottom
  );

  text(
    nf(yMax, 0, 2),
    left - 10,
    top
  );


  // ----------------------------------------------------------
  // Display data information
  // ----------------------------------------------------------

  textAlign(LEFT, TOP);
  textSize(14);

  text(
    "X: min = " + nf(xMin, 0, 2)
    + "   max = " + nf(xMax, 0, 2),
    left,
    15
  );

  text(
    "Y: min = " + nf(yMin, 0, 2)
    + "   max = " + nf(yMax, 0, 2),
    left + 300,
    15
  );
}
