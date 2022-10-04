// 1조 이주석 질문
#include <iostream>
#include <Eigen/Dense> // Eigen library
using namespace Eigen; // Eigen namespace를 사용한다.
using namespace std;   // std namespace를 사용한다.

int main()
{
	//벡터 포인터 배열 동적 선언하고 (Page14)
	//내적 dot 구해보기
	VectorXd* pvec = new VectorXd[4];
	pvec[0] = VectorXd(4); // 열벡터가 들어감.
	pvec[1] = VectorXd(4);
	pvec[2] = RowVectorXd(4); // 행벡터가 들어감???
	pvec[3] = VectorXd(4); // 열벡터가 들어감.

	pvec[0] << 0.5, 0.5, 0.5, 0.5;
	pvec[1] << 0.5, 0.5, -0.5, -0.5;
	pvec[2] << 0.5, -0.5, -0.5, 0.5;
	pvec[3] << 0.5, -0.5, 0.5, -0.5;

	//각 벡터의 값 출력
	for (int i = 0; i < 4; i++) {
		cout << endl << "pvec[" << i << "]= " << endl << pvec[i] << endl;
		cout << "(rows,cols) = (" << pvec[i].rows() << 
			" " << pvec[i].cols() <<")\n"; // RowVector also (4 1)
	}
	MatrixXd D(4, 4);
	for (int i = 0; i < 4; i++) for (int j = 0; j < 4; j++) D(i, j) = pvec[i].dot(pvec[j]);
	cout << " Dij \n" << D << endl;
	MatrixXd C(4, 4);
	for (int i = 0; i < 4; i++) C.col(i) = pvec[i];
	cout << " Cij \n" << C << endl;
	VectorXd v1(4);
	RowVectorXd v2(4);
	v1 << 120, 100, -50, 20;
	v2 << -20, 100, 150, -40;

	cout << " v1 " << v1 << endl;       // default is column vector
	cout << " v1 (rows,cols) = (" << v1.rows() << " " << v1.cols() << ")\n"; // (4 1)
	cout << " v2 " << v2 << endl;       // row vector
	cout << " v2 (rows,cols) = (" << v2.rows() << " " << v2.cols() << ")\n"; // RowVector (1 4)
	cout << " (4X4X4X1) C v1 \n" << C * v1 << endl;  // The output is a column vector
	cout << " (4X4X1X4) C v2 \n" << C * v2 << endl;  // no error, but, not valid result!!
	cout << " (4X1X4X4) v1 C \n" << v1 * C << endl;  // no error, but, not valid result!!
	cout << " (1X4X4X4) v2 C \n" << v2 * C << endl;  // The output is a row vector
	delete[] pvec;

	return 0;
}
