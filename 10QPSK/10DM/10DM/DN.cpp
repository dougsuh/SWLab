// DougFo Play: Nov. 13, 2022
#include <Eigen/Dense>
#include "DM.h"
using namespace std;
using namespace Eigen;

virtual void digitalModulation::encode(int data) {}  // s = a0 c0 + a1 c1
void digitalModulation::noise(){                      // r = s + n
}
virtual int digitalModulation::decode() {}; //  return decoded data (calculate ad0 ad1)
int digitalModulation::countError(int data, int decoded_data) {
	;
}