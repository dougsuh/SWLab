// GF(256) Matrix Inversion using Gauss-Jordan Elimination
// Irreducible polynomial: x^8 + x^4 + x^3 + x^2 + 1 (0x11d)
//
// Doma Suh   Jan. 21, 2026
//    int as char, since Java does not have unsigned char 
// GF256    + - / * 
// matrix multiplication, inverse 
int N = 3;  // matrix size
GF256 gf = new GF256();
void setup() {
  int[][] A = { {1, 2, 3, 4},{4, 5, 6, 6},{7, 8, 10, 12},{17, 8, 110, 2} };
  //int[][] A = { {0, 1, 0},{0, 0, 1},{1, 0, 0} };

  int[][] invA = gaussJordanInverse(A);

  println("Original matrix:");
  printMatrix(A);

  println("\nInverse matrix (GF(256)):");
  if (invA != null) {
    printMatrix(invA);
  } else {
    println("Matrix is not invertible in GF(256)");
  }
  println("\n AIA :");
  int [][] AIA = multiplyMatrix(invA,A);
  
    printMatrix(AIA);
  noLoop();
}
void printMatrix(int[][] M) {
  for (int i = 0; i < M.length; i++) {
    for (int j = 0; j < M[0].length; j++) {
      print(nf(M[i][j], 3) + " ");
    }
    println();
  }
}
