/***********************************
 test complex operation
 author : Doug Young Suh
 date   : 2016.6.27

 /* 44.1kHz ���ø��� data�� N=1024�� DFT�ϸ�, frequency resolution�� 
   (��, k=1���̰� ���ļ� ���̷δ�) 44100/1024=43.07Hz�̴�. 
   43.07Hz�� �������̸� k���� ������ ������ �׷��� ���� ���� ��� �ɱ�?
 ������ cos 2��430.7t(��, k=10)�� cos 2��450t(��, k=10.45)�� DFT�� ���Ѵ�.
 ���� cos 2��4307t(��, k=100)�� cos 2��4500t(��, k=104.5)�� DFT�� ���Ѵ�.*/
//  Revision
//   Nov 18, 2020  STL complex, iostream, fstream, cmath
//************************* **************/
#include <iostream>
#include <fstream>
#include <cmath>
#include <complex>
#include "fft1D.h"
using namespace std;
const int N = 1024;

int main()
{
	long n,k;
	FFT* xx1, * xx2;
	xx1 = new FFT(N);
	xx2 = new FFT(N);
	for (n = 0; n < N; n++){
		xx1->x[n] = complex<double>(1000.*cos(2.*3.141592*430.7*n / 44100.0), 0.0);
		xx2->x[n] = complex<double>(1000.*cos(2.*3.141592*450.7*n / 44100.0), 0.0);
	}
	xx1->ForwardFFT();
	xx2->ForwardFFT();

	ofstream fff("k10.txt");
	if (!fff) cout << " cant open \n";
	for (k = 20; k > 0; k--) {
		fff << -k << "  " <<  abs(xx1->X[N - k]) << "  " << abs(xx2->X[N - k]) << endl;
		cout << -k << "  " << abs(xx1->X[N - k]) << "  " << abs(xx2->X[N - k]) << endl;
	}
	for (k = 0; k < 20; k++) {
		fff << k << "  " << abs(xx1->X[k]) << "  " << abs(xx2->X[k]) << endl;
		cout << k << "  " << abs(xx1->X[k]) << "  " << abs(xx2->X[k]) << endl;
	}
	fff.close();

	getchar();
	return 400;
}

/*/ test 1: DFT of square x[n]
for (n = 0; n<N; n++)    sequence->x[n] = complex(0.0, 0.0);
for (n = 0; n<16; n++)   sequence->x[n] = complex(1.0, 0.0);
for (n = N - 15; n<N; n++) sequence->x[n] = complex(1.0, 0.0);
sequence->ForwardFFT();
if ((fff = fopen("DFTofSquare.txt", "w")) == NULL) {
	printf("cant open DFTofSquare.txt.\n");
	exit(333);
}
for (k = N / 2; k<N - 1; k++) fprintf(fff, "%10.3e \n", sequence->X[k].re);
for (k = 0; k<N / 2 + 1; k++) fprintf(fff, "%10.3e \n", sequence->X[k].re);
fclose(fff);

// test 2: DFT of ideal low pass filter X[k]
for (k = 0; k<N; k++)    sequence->X[k] = complex(0.0, 0.0);
for (k = 0; k<16; k++)   sequence->X[k] = complex(1.0, 0.0);
for (k = N - 15; k<N; k++) sequence->X[k] = complex(1.0, 0.0);
sequence->InverseFFT();
if ((fff = fopen("IDFTofLPF.txt", "w")) == NULL) {
	printf("cant open IDFTofLPF.txt.\n");
	exit(334);
}
for (n = N / 2; n<N - 1; n++) fprintf(fff, "%10.3e \n", sequence->x[n].re);
for (n = 0; n<N / 2 + 1; n++) fprintf(fff, "%10.3e \n", sequence->x[n].re);
fclose(fff);
// test 1: DFT of square x[n]
	for(n=0;n<N;n++)    sequence->x[n] = complex(0.0,0.0);
	for(n=0;n<16;n++)   sequence->x[n] = complex(1.0,0.0);
	for(n=N-15;n<N;n++) sequence->x[n] = complex(1.0,0.0);
	sequence->ForwardFFT();
	if((fff = fopen("DFTofSquare.txt","w")) == NULL) {
		printf("cant open DFTofSquare.txt.\n");
		exit(333);
	}
	for(k=N/2;k<N-1;k++) fprintf(fff,"%10.3e \n",sequence->X[k].re);
	for(k=0;k<N/2+1;k++) fprintf(fff,"%10.3e \n",sequence->X[k].re);
    fclose(fff);

	// test 2: DFT of ideal low pass filter X[k]
	for(k=0;k<N;k++)    sequence->X[k] = complex(0.0,0.0);
	for(k=0;k<16;k++)   sequence->X[k] = complex(1.0,0.0);
	for(k=N-15;k<N;k++) sequence->X[k] = complex(1.0,0.0);
	sequence->InverseFFT();
	if((fff = fopen("IDFTofLPF.txt","w")) == NULL) {
		printf("cant open IDFTofLPF.txt.\n");
		exit(334);
	}
	for(n=N/2;n<N-1;n++) fprintf(fff,"%10.3e \n",sequence->x[n].re);
	for(n=0;n<N/2+1;n++) fprintf(fff,"%10.3e \n",sequence->x[n].re);
    fclose(fff);
	*/
