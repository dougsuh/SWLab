// GF(256) Matrix Inversion using Gauss-Jordan Elimination
// Irreducible polynomial: x^8 + x^4 + x^3 + x^2 + 1 (0x11d)
//
// Doma Suh   Jan. 21, 2026
//    int as char, since Java does not have unsigned char 
// GF256    + - / * 
// int[][] multiplyMatrix(int[][] A, int[][] B)
// int[][] gaussJordanInverse(int[][] matrix) {
int N = 3;  // matrix size
GF256 gf = new GF256();
int L = 5; // length of a packet (could be 2000 or over) 
int k = 4; // number of data packets (less tham 200)
void setup() {
  int[][] Data = { {1, 2, 3, 4,3},{4, 5, 6, 6,3},{7, 8, 10, 12,12},{17, 8, 110, 2,210} };
  int[][] Q = { {1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1},
                {120,111,50,30},{30,70,121,88},{33,54,101,210} }; // 
  println("Original data:");   printMatrix(Data);  // encoding
  println("Q:");   printMatrix(Q);  // Q matrix
  int[][] QData = multiplyMatrix(Q,Data);  // (7X4)X(4X5) = 7X5
  println("QData:");   printMatrix(QData);  
  // select lost and make A matrix  for example loss of 2 packets
  int[][] A = lossPacket(Q,2,3);     // 4X4
  println("A:");   printMatrix(A);  
  int[][] invA = gaussJordanInverse(A);  // 4X4
  println("invA:");   printMatrix(invA);  
  int[][] QDatax = lossPacket(QData,2,3);     // 4X5
  println("QDatax:");   printMatrix(QDatax);  
  int[][] DecodedData = multiplyMatrix(invA,QDatax); // 4X5

  println("\n DecodedData:");   printMatrix(DecodedData);
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
