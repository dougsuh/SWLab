// DougFO Play: Nov. 14, 2022
#include <iostream>
#include <Eigen/Dense>
#include "QPSK.h"
#include "testGauss.h"
using namespace std;
using namespace Eigen;
int main() {
	// test if N(0, 1) is default
	gg G;
	cout << " Ex " << G.ex << " Vx " << G.vx << endl;
	//if (G.vx != 0) return 22;
	// 
	// digital modulation
	QPSK dm;
	dm = QPSK(20, 4, 2, 100.0);
	cout << dm.N << " " << dm.Nbits << " " << dm.SNR << " " << dm.Nsymbols << endl;
	// DM test
	dm.number_of_bits = 32;
	int ii = dm.number_of_bits / dm.Nbits;
	ii = 4;
	for (int i = 0; i <ii; i++) {
		dm.data = i;
		dm.encode();
		// cout << "(" << dm.s.transpose() << ")";
		dm.noise();
		dm.decode();
		cout << " noise (" << dm.ad0 << ", " << dm.ad1 << ") ";
		cout << dm.data << "->" << dm.decoded_data << " " << dm.countError() << " " << dm.number_of_error_bits << endl;
	}
	cout << " BER = " << dm.number_of_error_bits / (float)dm.number_of_bits << endl;
	return 1;
}