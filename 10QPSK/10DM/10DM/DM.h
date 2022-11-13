// DougFo Play: Nov. 13, 2022
#pragma once
#include <Eigen/Dense>
using namespace std;
using namespace Eigen;

class eclass {
public:
	eclass() {};
	eclass(int N, int M) {
		v.resize(M); // M by 1
		m.resize(N, M); // N by M
	};
	VectorXd v, w1, w2;
	MatrixXd m;
	VectorXd mv() {
		w1 = m * v;
		return w1;
		// return v*m; // error!!
	}
};
class digitalModulation {
public:
	digitalModulation() {
		N = 20; 
		Nsymbols = 4;
		Nbits = 2; // 2^Nbits = Nsymbols
		a0 = new float[Nsymbols];
		a1 = new float[Nsymbols];
		c0.resize(N);
		c1.resize(N);
		s.resize(N);
		r.resize(N);
	};
	int N; // number of samples in a basis
	VectorXd c0, c1; // orthonormal vectors with size of N
	int Nsymbols;     // number of symbols
	int Nbits;           // number of bits per symbols 
	int data;            // data to send (e.g. QPSK 0 1 2 3)
	float* a0, * a1; // normalized amplitudes
	float A, sqrtNo2; // signal strength noise strength in volts 
	float ad0, ad1;   // decoded coordinates
	VectorXf s, r; // sent vector and received vectors with size of N
	int number_of_bits, number_of_error_bits;
	//ostream    xout // output text file    (data, a0’, a1’) in each line
	virtual void encode(int data);  // s = a0 c0 + a1 c1
	void noise();                      // r = s + n
	virtual int decode();            //  return decoded data (calculate ad0 ad1)
	int countError(int data, int decoded_data);
};