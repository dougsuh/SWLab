//////////////////////////////
// Author: Doug Young Suh
// Date:   July 12, 2020
//
//  covariance matrix
//////////////////////////////
#include <iostream>
#include <fstream>
#include <eigen/Dense>
#include <cmath>
using namespace Eigen;
using namespace std;
const int P = 4; // iris data of 4 features
const int N = 50; // iris data of 100 observations

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
	dataX dd;
	// read data
	ifstream iris("iris.txt");
	int dumm;
	for (int turn = 0; turn < 3; turn++) {
		for (int i = 0; i < N; i++) {
			all_data[i].resize(P);
			for (int j = 0; j < P; j++) iris >> all_data[i](j);
			iris >> dumm;
		}
		dd.analyze(all_data);
		xcout << "\n type " << dumm << endl;
		xcout << "\n mean\n" << dd.mean << endl;
		xcout << " covariance\n" << dd.covariance << endl;
	}
	iris.close();	
	xcout.close();

	getchar();
    return 0;
}

