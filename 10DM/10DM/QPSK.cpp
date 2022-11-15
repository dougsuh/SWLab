#include "QPSK.h"
#include <iostream>
/*void QPSK::encode() {
	s = a0[data] * c0 + a1[data] * c1;
}*/
void QPSK::decode() { //  return decoded data (calculate ad0 ad1)
	ad0 = r.dot(c0);
	ad1 = r.dot(c1);
	// QPSK 	
	if (ad0 > 0 && ad1 > 0) decoded_data = 0;
	else if (ad0 > 0 && !(ad1 > 0)) decoded_data = 1;
	else if (!(ad0 > 0) && ad1 > 0) decoded_data = 2;
	else decoded_data = 3;
	cout << " QPSK decode \n";
}
void QPSK::setSymbols() {
	Eb = 1.;
	No2 = Eb / SNR;
	a = sqrt(Eb); // unit signal strength QPSK  2a^2 = 2Eb
	sigma = sqrt(No2);
	a0[0] = a0[1] = a;
	a0[2] = a0[3] = -a;
	a1[0] = a1[2] = a;
	a1[1] = a1[3] = -a;
	cout << " QPSK setsymbol " << No2 << " a " << a << endl;
}