//////////////////////////////
// Author: Doug Young Suh
// Date:   July 18 2020
//
//  covariance matrix: iris (p 4, N 50)
//  Revision 1: planeCloud (p 3, N 200)
//  Revision 2: Eigen-vector
//////////////////////////////
#include <iostream>
#include <fstream>
#include <eigen/Dense>
#include <eigen/LU>
#include <cmath>
using namespace Eigen;
using namespace std;
//const int P = 4; // iris data of 4 features
//const int N = 50; // iris data of 100 observations
const int P = 3; // (x, y, z)
const int N = 200; // 200 points

				  // calculate mean vector
class dataX {
public:
	dataX() {
		mean.resize(P);
		covariance.resize(P, P);
	};
	VectorXf mean;
	MatrixXf covariance;
	void analyze(VectorXf *all_data) {
		for (int p = 0; p < P; p++) mean[p] = 0.0;
		for (int n = 0; n < N; n++) mean += all_data[n];
		mean /= (float)N;
		// calculate covariance
		for (int j = 0; j < P; j++) {
			for (int k = 0; k < P; k++) {
				covariance(j, k) = 0.0;
				for (int n = 0; n < N; n++) {
					covariance(j, k) += (all_data[n](j) - mean[j]) * (all_data[n](k) - mean[k]);
				}
				covariance(j, k) /= N - 1;
			}
		}
	}
};
int main()
{
	VectorXf all_data[N];
	ofstream xcout("covariance.txt");
	if (!xcout) return 666;
	dataX dd;
	// read data
	//ifstream iris("iris.txt");
	ifstream iris("planeCloud200.txt");
	if (!iris) return 667;
	int dumm;
	//for (int turn = 0; turn < 3; turn++) {   // 3 kinds iris
		for (int i = 0; i < N; i++) {
			all_data[i].resize(P);
			for (int j = 0; j < P; j++) iris >> all_data[i](j);
			//iris >> dumm;   // 3 kinds iris
		}
		dd.analyze(all_data);
		xcout << "\n type " << dumm << endl;
		xcout << "\n mean\n" << dd.mean << endl;
		xcout << " covariance\n" << dd.covariance << endl;
	//} // 3 kinds iris
	iris.close();	

	EigenSolver<MatrixXf> es;
	es.compute(dd.covariance);
	xcout << "The eigenvalues of A are:" << endl << es.eigenvalues() << endl;
	MatrixXf P(3, 3);
	for (int i = 0; i < 3; i++) for (int j = 0; j < 3; j++)
		P(i, j) = es.eigenvectors()(i, j).real();
	xcout << "\n\nP\n" << P << endl;

	xcout.close();
	//	getchar();
    return 123;
}

