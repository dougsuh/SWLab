// DougFO Play: Nov. 14, 2022
#include <iostream>
#include <Eigen/Dense>
#include "DM.h"
using namespace std;
using namespace Eigen;
int main() {
	digitalModulation dm;
	dm = digitalModulation(20, 4, 2, 1.0);
	dm.number_of_bits = 10;
	int ii = dm.number_of_bits / dm.Nbits;
	for (int i = 0; i <ii; i++) {
		dm.data = rand() % 4;
		dm.encode();
		dm.noise();
		dm.decode();
		cout << dm.data << " " << dm.decoded_data << " " << dm.countError() << endl;
	}
	cout << " BER = " << dm.number_of_error_bits / (float)dm.number_of_bits << endl;
	return 1;
}