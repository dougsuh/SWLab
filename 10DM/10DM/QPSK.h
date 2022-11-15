#pragma once
#include "DM.h"
class QPSK : public digitalModulation {
public:
	QPSK() {
		N = 20;    // samples per symbol
		Nsymbols = 4;
		Nbits = 2; // 2^Nbits = Nsymbols
		SNR = 1;
		initialize();
		setSymbols();
	};
	QPSK(int n, int ns, int nb, float snr) {
		N = n;    // samples per symbol
		Nsymbols = ns;
		Nbits = nb; // 2^Nbits = Nsymbols
		SNR = snr;
		initialize();
		setSymbols();
	}
	//void encode();            
	void decode();            //  return decoded data (calculate ad0 ad1)
	void setSymbols();
};
