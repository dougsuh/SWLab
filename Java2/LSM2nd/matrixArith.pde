float [][] transpose(float [][] A){
  float[][] AT = new float[A[0].length][A.length]; 
  for(int i=0;i<A.length;i++){
    for(int j=0;j<A[0].length;j++) AT[j][i] = A[i][j];
  }
   return AT;
}
float[] matrixVectorMult(float[][] A, float[] a) {
  int rows = A.length;
  int cols = A[0].length;
  // Dimension check
  if (cols != a.length) {
    println("Error: Matrix columns must match vector length.");
    return null;
  }
  float[] result = new float[rows];
  for (int i = 0; i < rows; i++) {
    float sum = 0;
    for (int j = 0; j < cols; j++) { sum += A[i][j] * a[j];  }
    result[i] = sum;
  }
  return result;
}
float[][] matrixMult(float[][] A, float[][] B) {
  int rowsA = A.length;
  int colsA = A[0].length;
  int rowsB = B.length;
  int colsB = B[0].length;

  // Dimension check
  if (colsA != rowsB) {
    println("Error: A's columns must match B's rows.");
    return null;
  }

  float[][] C = new float[rowsA][colsB];

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      float sum = 0;
      for (int k = 0; k < colsA; k++) {
        sum += A[i][k] * B[k][j];
      }
      C[i][j] = sum;
    }
  }

  return C;
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
// Print vector
void printVector(float[] v) {
  for (int i = 0; i < v.length; i++) {
      print(nf(v[i], 0, 3) + "  ");
    }
    println();
}
