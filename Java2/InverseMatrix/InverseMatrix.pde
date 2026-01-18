// Example matrix (can be 2x2, 3x3, ...)
float[][] A = {
  {0,1,1},
  {1,1,0},
  {1,0,1}
};

void setup() {
  float[][] inv = gaussJordanInverse(A);

  if (inv != null) {
    println("Inverse matrix:");
    printMatrix(inv);
  } else {
    println("Matrix is not invertible.");
  }
}

// Gauss–Jordan inverse with row swapping
float[][] gaussJordanInverse(float[][] matrix) {
  int n = matrix.length;
  float[][] aug = new float[n][2 * n];

  // Build augmented matrix [A | I]
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      aug[i][j] = matrix[i][j];
    }
    for (int j = n; j < 2 * n; j++) {
      aug[i][j] = (i == j - n) ? 1 : 0;
    }
  }

  // Gauss–Jordan elimination
  for (int i = 0; i < n; i++) {

    // If pivot is zero, swap with a lower row
    if (aug[i][i] == 0) {
      boolean swapped = false;
      for (int k = i + 1; k < n; k++) {
        if (aug[k][i] != 0) {
          swapRows(aug, i, k);
          swapped = true;
          break;
        }
      }
      if (!swapped) {
        return null; // singular matrix
      }
    }

    float pivot = aug[i][i];

    // Normalize pivot row
    for (int j = 0; j < 2 * n; j++) {
      aug[i][j] /= pivot;
    }

    // Eliminate other rows
    for (int k = 0; k < n; k++) {
      if (k != i) {
        float factor = aug[k][i];
        for (int j = 0; j < 2 * n; j++) {
          aug[k][j] -= factor * aug[i][j];
        }
      }
    }
  }

  // Extract inverse matrix
  float[][] inv = new float[n][n];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      inv[i][j] = aug[i][j + n];
    }
  }

  return inv;
}

// Swap two rows in a matrix
void swapRows(float[][] m, int r1, int r2) {
  float[] temp = m[r1];
  m[r1] = m[r2];
  m[r2] = temp;
}

// Print matrix
void printMatrix(float[][] m) {
  for (int i = 0; i < m.length; i++) {
    for (int j = 0; j < m[0].length; j++) {
      print(nf(m[i][j], 0, 3) + "  ");
    }
    println();
  }
}
