#include <fstream>
#include <iostream>
#include <eigen/Dense>
using namespace Eigen;
using namespace std;
void cc(VectorXf &c) {
	c << 1, 2;
}
int main()
{
	VectorXf m;
	m.resize(2);
	cc(m);
	cout << m << endl << endl;

	VectorXf a[3];
	a[0].resize(2);
	a[0] << 1, 2;
	a[1].resize(2);
	a[1] << 3, 4;
	a[2].resize(2);
	a[2] << 5, 6;
	cout << a[0] << endl;
	cout << a[1] << endl;
	cout << a[2] << endl;
	cout << a[2](0) << "  " << a[2](1) << endl;

	ofstream xx("six.txt");
	xx << a[0](0) << " " << a[0](1) << endl;
	xx << a[1](0) << " " << a[1](1) << endl;
	xx << a[2](0) << " " << a[2](1) << endl;
	xx.close();

	VectorXf b[3];
	ifstream yy("six.txt");
	for (int i = 0; i < 3; i++) {
		b[i].resize(2);
		float x;
		yy >> b[i](0) >> b[i](1);
		cout << b[i](0) << "  " << b[i](1) << endl;
	}
}
