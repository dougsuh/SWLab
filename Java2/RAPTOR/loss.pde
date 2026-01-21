int[][] lossPacket(int[][] A, int i, int j) {
  int rows = A.length;        // 7
  int cols = A[0].length;     // 5
  // Result matrix should be k rows.
  int[][] B = new int[k][cols];
  int bRow = 0;
  for (int aRow = 0; aRow < rows; aRow++) {
    // Skip i-th and j-th rows
    if (aRow == i || aRow == j) continue;
    for (int c = 0; c < cols; c++) {
      B[bRow][c] = A[aRow][c];
    }
    bRow++;
    if(bRow == k) break;
  }
  return B;
}
