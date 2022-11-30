#include "perceptron.h"
Perceptrons::Perceptrons(int n) {

	nIn = n;
	w = new double[nIn];
	// Java������ �ʱⰪ�� 0���� �Ǿ������� C++������ �����־����
	//w[0] = 0.1; // suh   �̰� ������ 45%���� 100%�� �ٲ��. 
	//w[1] = 0.1; // suh
	for(int i = 0; i<nIn;i++) w[i] = 0.1; // suh   �̰� ������ 45%���� 100%�� �ٲ��. 
	//w[1] = 0.1; // suh
}

int Perceptrons::train(double *x, int t, double learningRate) {

	int classified = 0;
	double c = 0.;

	// check if the data is classified correctly
	for (int i = 0; i < nIn; i++) {
		c += w[i] * x[i] * t;
	}

	// apply steepest descent method if the data is wrongly classified
	if (c > 0) {
		classified = 1;
	}
	else {
		for (int i = 0; i < nIn; i++) {
			w[i] += learningRate * x[i] * t;
		}
	}
	return classified;
}

int Perceptrons::predict(double *x) {

	double preActivation = 0.;

	for (int i = 0; i < nIn; i++) {
		preActivation += w[i] * x[i];
	}

	return step(preActivation);
}
int Perceptrons::step(double x) {
	if (x > 0) return 1;
	return -1;
}
