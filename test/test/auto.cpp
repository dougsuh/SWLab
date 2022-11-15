#include <iostream>
using namespace std;
int main()
{
	int ii[5];
	float xx[4];
	for (int i = 0; i < 5;i++) { ii[i] = 10*i; }
	for (int i = 0; i < 4; i++) { xx[i] = 100*i; }

	for (auto& i : ii) { cout << "  " << i ; } cout << endl;
	for (auto& x : xx) { cout << "  " << x ; } cout << endl;


	float *yy;
	yy = new float[6];
	for (int i = 0; i < 6; i++) { yy[i] = 1000 * i; }
	//for (auto& x : yy) { cout << x << " "; } cout << endl; // not working for dynamic memory

	return 123;
}