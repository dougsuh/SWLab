//////////////////////////////
// Author: Doug Young Suh
// Date:   July 14, 2020
//
//  covariance matrix of cars data
//  n = 10   p = 2
//////////////////////////////
#include <iostream>
#include <fstream>
#include <eigen/Dense>
#include <cmath>
using namespace Eigen;
using namespace std;
const int P = 2; // cars data of 2 features
const int N = 10; // cars data of 10 observations

class dataX {
public:
	dataX() {
		mean.resize(P);
		sigma.resize(P);
		covariance.resize(P, P);
		correlation.resize(P, P);
	}
	VectorXf mean,sigma;
	MatrixXf covariance, correlation;
	// calculate PXP covariance matrix and correlation matrix
	void analyze(VectorXf * all_data) {
		for (int p = 0; p < P; p++) mean[p] = 0.0;
		// mean
		for (int n = 0; n < N; n++) mean += all_data[n];
		mean /= (float)N;
		// calculate covariance 		
		for (int j = 0; j < P; j++) {
			for (int k = j; k < P; k++) {
				covariance(j, k) = 0.0;
				for (int n = 0; n < N; n++) {
					covariance(j, k) += (all_data[n](j) - mean[j]) * (all_data[n](k) - mean[k]);
				}
				covariance(j, k) /= (float)(N - 1);
				covariance(k, j) = covariance(j, k);
			}
		}
		for (int p = 0; p < P; p++) sigma[p] = sqrt(covariance(p, p));
		for (int j = 0; j < P; j++) {
			correlation(j, j) = 1.0;
			for (int k = j+1; k < P; k++) 
				correlation(j, k) = correlation(k, j) = covariance(j, k) / sigma(j) / sigma(k);
		}
	}
};
int main()
{
	VectorXf gas(N),kg(N);
	gas <<  31, 25, 26, 26, 30, 31, 28, 25, 27, 25;
	kg << 2705, 3560, 3375, 3405, 3640, 2880, 3470, 4105, 3495, 3620;
	VectorXf alldata[N];
	for (int i = 0; i < N; i++) {
		alldata[i].resize(2);
		alldata[i](0) = gas(i);
		alldata[i](1) = kg(i);
		cout << alldata[i](0) << "  " << alldata[i](1) << endl;
	}
	dataX ss;
	ss.analyze(alldata);
	ofstream xcout("covarianceCars.txt");
	xcout << " mean \n" << ss.mean << "\n";
	xcout << "\n\n sigma \n" << ss.sigma << "\n";
	xcout << "\n\n covariance \n" << ss.covariance << "\n";
	xcout << "\n\n correlation \n" << ss.correlation << "\n";

	cout << " mean \n" << ss.mean << "\n";
	cout << "\n\n sigma \n" << ss.sigma << "\n";
	cout << "\n\n covariance \n" << ss.covariance << "\n";
	cout << "\n\n correlation \n" << ss.correlation << "\n";
	xcout.close();

	getchar();
    return 5;
}

