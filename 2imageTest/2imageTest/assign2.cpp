// assignment 2
#include <iostream>
#include "bmpNew.h"  // suh
int main() {
	int x=200, y=300;
	int xy = x * y * 3;
	unsigned char* outbmp = new unsigned char[xy];
	// make red block
	for (int i = 0; i < y; i++) {
		int ix = i * x * 3;
		int lines = i;
		if (lines > 255) lines = 255;
		for (int j = 0; j < x; j++) {
			outbmp[ix + j * 3] = 0;       // G
			outbmp[ix + j * 3 + 1] = 0;   // B
			outbmp[ix + j * 3 + 2] = lines; // R
		}
	}
	// write a bmp file
	WriteBmp("RedGrad.bmp", outbmp, x, y);
	return 1;
}