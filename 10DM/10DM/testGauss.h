#include <iostream>
#include <Eigen/Dense>
#include <random>
using namespace std;
using namespace Eigen;
class gg {
public:
	gg() {
		ex = vx = 0;
		exvx();
	}
	default_random_engine generator;
	normal_distribution<float> myGauss;
	float ex, vx;
	void exvx() {
		float x;
		for (int i = 0; i < 10000; i++) {
			x = myGauss(generator);
			ex += x; vx += x * x;
		}
		ex /= 10000;
		vx /= 10000;
		vx -= ex * ex;
	}
};
