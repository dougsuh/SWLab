#include <iostream>
using namespace std;
void set5(float& y) { y = 5; }
void set6(float *y) { *y = 6; }
void alloc10(float** y) {
	float* z = new float[10];
	*y = z;
	for (int i = 0; i < 10; i++) z[i] = i;
}
void alloc5(float* &y) { // OK
	y = new float[10];
	for (int i = 0; i < 5; i++) y[i] = i*10;
}
int main()
{
	float x;
	set5(x);    cout << x << endl;
	set6(&x);    cout << x << endl;

	float* xx;
	alloc10(&xx);
	for (int i = 0; i < 10; i++) cout << xx[i] << " "; cout << endl;
	delete xx;

	alloc5(xx);
	for (int i = 0; i < 5; i++) cout << xx[i] << " "; cout << endl;
	delete xx;
	return 123;
}