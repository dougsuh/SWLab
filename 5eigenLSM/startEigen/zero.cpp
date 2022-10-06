// 초기에 벡터 또는 matrix 값을 0으로 한다.
#include <iostream>
#include <Eigen/Dense> // Eigen library
using namespace Eigen; // Eigen namespace를 사용한다.
using namespace std;   // std namespace를 사용한다.
int main() {
	VectorXf a(4);
	MatrixXf A(3, 3);
	cout << a << endl;
	cout << A << endl;
	a = VectorXf::Zero(4);
	A = MatrixXf::Zero(3,3);
	cout << a << endl;
	cout << A << endl;
	a = VectorXf::Random(4);
	A = MatrixXf::Random(3, 3);
	cout << a << endl;
	cout << A << endl;
	return 123;
}