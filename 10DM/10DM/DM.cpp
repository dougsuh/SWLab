// DougFo Play: Nov. 13, 2022
#include "DM.h"
#include <iostream>
using namespace std;
using namespace Eigen;
const float PI = 3.141592;

void digitalModulation::initialize() {
	a0 = new float[Nsymbols];
	a1 = new float[Nsymbols];
	c0.resize(N);
	c1.resize(N);
	s.resize(N);
	n.resize(N);
	r.resize(N);
	float sqt = sqrt(2.0 / (double)N);
	for (int i = 0; i < N; i++) {
			c0[i] = sqt * cos(2 * PI * i / N);
			c1[i] = sqt * sin(2 * PI * i / N);
	}
	number_of_error_bits = 0;
	cout << " DM initialize SNR " << SNR << endl;
}
void digitalModulation::encode() {
	s = a0[data] * c0 + a1[data] * c1;
	cout << data << "= data  a0 " << a0[data] << " a1 " << a1[data] << endl;
} 
void digitalModulation::noise(){             // r = s + n
	for (int i = 0; i < N; i++) n(i) = myGauss(generator)*sigma;
	r = s + n;
	cout << n.transpose() << endl;
}
void digitalModulation::decode() { //  return decoded data (calculate ad0 ad1)
	/*ad0 = r.dot(c0);
	ad1 = r.dot(c1);
	// QPSK 	
	if (ad0 > 0 && ad1 > 0) decoded_data = 0;
	else if (ad0 > 0 && !(ad1 > 0)) decoded_data = 1;
	else if (!(ad0 > 0) && ad1 > 0) decoded_data = 2;
	else decoded_data = 3;*/
	cout << " DM decode \n";
}
void digitalModulation::setSymbols(){
	/* QPSK
	Eb = 1.;
	No2 = Eb / SNR;
	a = sqrt(Eb); // unit signal strength QPSK  2a^2 = 2Eb
	sigma = sqrt(No2);
	a0[0] = a0[1] = a;
    a0[2] = a0[3] = -a;
	a1[0] = a1[2] = a;
	a1[1] = a1[3] = -a;*/
	cout << " DM setsymbol SNR " << SNR << endl;
}

int digitalModulation::countError() {
	int Xor = data ^ decoded_data;
	cout << Xor << " = " << data << "^" << decoded_data << ": ";
	int count, mask;
	count = 0; mask = 1;
	for (int i = 0; i < Nbits; i++, mask *= 2)
		if ((mask & Xor) != 0) count++;

	number_of_error_bits += count;
	return count;
}