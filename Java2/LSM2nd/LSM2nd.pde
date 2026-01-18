int N = 5; // number of data
int M = 2; // degree
float [][] A;
float [] x = {1,2,3,4,-1};
float [] y = {3.2,6.8,12.5,22,1.1};
void setup() {
  A = new float[N][M+1];
  for (int i = 0; i < N; i++) {
    A[i][0] = x[i] * x[i];
    A[i][1] = x[i];
    A[i][2] = 1.0;
  }
  println("A");
  printMatrix(A);

  float [][] AT = transpose(A);  
  println("AT");
  printMatrix(AT);
  float [][] ATA = matrixMult(AT, A);
  println("ATA");
  printMatrix(ATA);
  float [][] ATAI = inverse(ATA);
  println("ATAI");
  printMatrix(ATAI);
  float [] ATy = matrixVectorMult(AT,y);
  float [] a = matrixVectorMult(ATAI, ATy);
  printVector(a);
}
