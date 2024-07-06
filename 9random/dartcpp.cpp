#include <iostream>
using namespace std;
const int N = 3;
void pdf2cdf(int, float* p, float* c);
int toss(int, float*);
int main() {
	float pdf[N], cdf[N];
	pdf[0] = 0.5; // A
	pdf[1] = 0.25; // B
	pdf[2] = 0.25; // C
	pdf2cdf(N, pdf, cdf);
	// simulatioin
	int counts[N];
	for (int n = 0; n < N; n++) counts[n] = 0;
	int NN = 10000;
	for (int i = 0; i < NN; i++) {
		counts[toss(N, cdf)]++;
	}
	for (int n = 0; n < N; n++) {
		cout << counts[n] << endl;
	}
	return 123;
}
int toss(int NN, float* CDF) {
	float pp = rand()/(float)RAND_MAX; // 0 < pp < 1
	for (int n = 0; n < NN; n++) {
		if (pp < CDF[n]) return n;
	}
	return NN - 1;
}
void pdf2cdf(int NN, float* p, float* c) {
	c[0] = p[0];
	for(int n=1;n<NN;n++) c[n] = c[n-1]+p[n];
}