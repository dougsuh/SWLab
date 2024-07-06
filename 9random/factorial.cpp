#include <iostream>
using namespace std;
int factorial(int);
int factorial_old(int);
int main() {
	int n=0;
	while (n != -1) {
		cout << " integer n (-1 to quit) : ";
		cin >> n;
		if (n == -1) break;
		cout << "\n " << n << "! = \n";
		cout << "  " << factorial(n) << endl;
		cout << "  " << factorial_old(n) << endl;
	}
	return 10;
}
int factorial(int n) {
	if (n <= 0 || n == 1) return 1;
	return n * factorial(n - 1);
}
int factorial_old(int n) {
	if (n <= 0 || n == 1) return 1;
	int ff = 1;
	for (int i = 1; i <= n; i++) ff *= i;
	return ff;
}