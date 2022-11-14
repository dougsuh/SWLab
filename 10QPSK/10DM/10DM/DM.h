// DougFo Play: Nov. 13, 2022
#pragma once
#include <Eigen/Dense>
#include <random>
using namespace std;
using namespace Eigen;

class digitalModulation {
public:
	digitalModulation() {
		N = 20;    // samples per symbol
		Nsymbols = 4;
		Nbits = 2; // 2^Nbits = Nsymbols
		initialize();
	};
	digitalModulation(int n, int ns, int nb) {
		N = n;    // samples per symbol
		Nsymbols = ns;
		Nbits = nb; // 2^Nbits = Nsymbols
		initialize();
	};
	int N; // number of samples in a basis
	VectorXd c0, c1; // orthonormal vectors with size of N
	int Nsymbols;     // number of symbols
	int Nbits;           // number of bits per symbols 
	int data;            // data to send (e.g. QPSK 0 1 2 3)
	float* a0, * a1; // normalized amplitudes
	float A, No2; // signal strength noise strength in volts 
	float ad0, ad1;   // decoded coordinates
	VectorXf s, r; // sent vector and received vectors with size of N
	int number_of_bits, number_of_error_bits;
	//ostream    xout // output text file    (data, a0’, a1’) in each line
	virtual void encode(int data);  // s = a0 c0 + a1 c1
	default_random_engine generator;
	normal_distribution<double> myGauss;
	void noise();                      // r = s + n
	virtual int decode();            //  return decoded data (calculate ad0 ad1)
	int countError(int data, int decoded_data);
	void initialize();
	virtual void setSymbols();
};