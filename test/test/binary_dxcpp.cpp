#include <iostream>
using namespace std;
void binary(float);
int main() {
	binary(0.1);
	binary(0.01);
	binary(0.125);
	binary(0.125/8);
}
void binary(float x) {
	float rx = x;
	float n2 = 0.5;
	int iteration = 0;
	std::cout << x << "\t  0.";
	while (rx != 0 && iteration++ < 20) {
		if (rx >= n2) { std::cout << "1"; rx -= n2; }
		else	std::cout << "0";
		n2 /= 2;
	}
	std::cout << endl;
}