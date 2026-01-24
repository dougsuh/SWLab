// Gauss–Jordan inverse with row swapping
int[][] gaussJordanInverse(int[][] matrix) {
  int n = matrix.length;
  int[][] aug = new int[n][2 * n];

  // Build augmented matrix [A | I]
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) { aug[i][j] = matrix[i][j];    }
    for (int j = n; j < 2 * n; j++) {      aug[i][j] = (i == j - n) ? 1 : 0;   }
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
      if (!swapped) {   return null; }// singular matrix
    }
    int pivot = aug[i][i];
    // Normalize pivot row
    for (int j = 0; j < 2 * n; j++) {    aug[i][j] = gf.divide(aug[i][j],pivot);   }
    // Eliminate other rows
    for (int k = 0; k < n; k++) {
      if (k != i) {
        int factor = aug[k][i];
        for (int j = 0; j < 2 * n; j++) {
          aug[k][j] = gf.subtract(aug[k][j],gf.multiply(factor, aug[i][j]));
        }
      }
    }
  }

  // Extract inverse matrix
  int[][] inv = new int[n][n];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      inv[i][j] = aug[i][j + n];
    }
  }
  return inv;
}

// Swap two rows in a matrix
void swapRows(int[][] m, int r1, int r2) {
  int[] temp = m[r1];
  m[r1] = m[r2];
  m[r2] = temp;
}
// Multiply two matrices A and B
// A: rowsA x colsA
// B: colsA x colsB
int[][] multiplyMatrix(int[][] A, int[][] B) {
  int rowsA = A.length;
  int colsA = A[0].length;
  int rowsB = B.length;
  int colsB = B[0].length;

  // Dimension check
  if (colsA != rowsB) {
    println("Matrix multiplication not possible!");
    return null;
  }

  int[][] C = new int[rowsA][colsB];

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      int sum = 0;
      for (int k = 0; k < colsA; k++) {
        sum = gf.add(sum,gf.multiply(A[i][k], B[k][j]));
      }
      C[i][j] = sum;
    }
  }
  return C;
}
