// DougFo Play: Nov. 13, 2022
#include "DM.h"
using namespace std;
using namespace Eigen;
const float PI = 3.141592;

void digitalModulation::initialize() {
	a0 = new float[Nsymbols];
	a1 = new float[Nsymbols];
	c0.resize(N);
	c1.resize(N);
	s.resize(N);
	r.resize(N);
	float sqt = sqrt(2.0 / (double)N);
	for (int i = 0; i < N; i++) {
			c0[i] = sqt * cos(2 * PI * i / N);
			c1[i] = sqt * sin(2 * PI * i / N);
	}
	A = 1.0; // unit signal strength 
	normal_distribution<double> myGauss(0, No2);  // need to be checked!!
}
void digitalModulation::encode(int data) {}  // s = a0 c0 + a1 c1
void digitalModulation::noise(){             // r = s + n
	for (int i = 0; i < N; i++) r(i) = s(i) + myGauss(generator);
}
int digitalModulation::decode() {}; //  return decoded data (calculate ad0 ad1)
int digitalModulation::countError(int data, int decoded_data) {
	int Xor = data ^ decoded_data;
	int count = 0, mask = 1;
	for (int i = 0; i < Nbits; mask *= 2)
		if ((mask & Xor) != 0) count++;
	return count;
}