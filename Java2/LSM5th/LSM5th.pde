int N; // number of data
int M = 5; // degree
float [][] A;
float [] x, y;
void setup() {
  N = readData("fit_data_5th.txt",x,y);
  A = new float[N][M+1];
  for (int i = 0; i < N; i++) {
    float xxx = 1.0, xx = x[i];
    A[i][M] = 1.0;
    for(int j = M;j>0;j--){
      A[i][j-1] = xxx;
      xxx *= xx;
    }
  }
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
