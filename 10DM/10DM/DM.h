// DougFo Play: Nov. 14, 2022
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
		SNR = 1;
		initialize();
		setSymbols();
	};
	digitalModulation(int n, int ns, int nb, float snr) {
		N = n;    // samples per symbol
		Nsymbols = ns;
		Nbits = nb; // 2^Nbits = Nsymbols
		SNR = snr;
		initialize();
		setSymbols();
	};
	int N; // number of samples in a basis
	VectorXf c0, c1; // orthonormal vectors with size of N
	int Nsymbols;     // number of symbols
	int Nbits;           // number of bits per symbols 
	int data, decoded_data;            // data to send (e.g. QPSK 0 1 2 3)
	float* a0, * a1; // normalized amplitudes
	float SNR, Eb, a, No2, sigma; // signal strength noise strength in volts 
	float ad0, ad1;   // decoded coordinates
	VectorXf s, n, r; // sent vector and received vectors with size of N
	int number_of_bits, number_of_error_bits;
	//ostream    xout // output text file    (data, a0? a1? in each line
	void encode();  // s = a0 c0 + a1 c1
	default_random_engine generator;
	normal_distribution<double> myGauss;
	void noise();                      // r = s + n
	virtual void decode();            //  return decoded data (calculate ad0 ad1)
	int countError();
	void initialize();
	virtual void setSymbols();
};