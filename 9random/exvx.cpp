#include <iostream>
#include <map>
using namespace std;
map<int, float> pdf, cdf;
float getEx();
float getVx();
void pdf2cdf();
float getExExp(int);
float getVxExp(int);
int main() {
	pdf[0] = 0.125;
	pdf[1] = 0.375;
	pdf[2] = 0.375;
	pdf[3] = 0.125;
	// Ex by pdf
	float Ex, Vx;
	Ex = getEx();
	Vx = getVx();
	cout << " Ex pdf : " << Ex << endl;
	cout << " Vx pdf : " << Vx << endl;
	// Ex by experiment
	pdf2cdf();
	Ex = getExExp(1000);
	Vx = getVxExp(1000);
	cout << " Ex experiment : " << Ex << endl;
	cout << " Vx experiment : " << Vx << endl;
	return 11;
}
float getEx() {
	float ex = 0;
	for (const auto& a : pdf) ex += a.first * a.second;
	return ex;
}
float getVx() {
	float ex, vx = 0;
	ex = getEx();
	for (const auto& a : pdf) 
		vx += a.first * a.first * a.second;
	vx -= ex * ex;
	return vx;
}
void pdf2cdf() {
	float p = 0;
	for (int i = 0; i < pdf.size(); i++) {
		p += pdf[i];
		cdf[i] = p;
		//cout << i << " " << cdf[i] << endl; // for debug
	}
}
// N : number of trials
float getExExp(int N) {
	float ex = 0, x;
	for (int n = 0; n < N; n++) {
		x = rand() / (float)RAND_MAX;
		for (const auto& a : cdf)
			if (a.second > x) {
				ex += a.first; break;
			}
		//cout << x << " " << ex << endl; // for debug
	} 
	return ex / N;
}
// N : number of trials
float getVxExp(int N) {
	float ex = 0, x, vx = 0;
	for (int n = 0; n < N; n++) {
		x = rand() / (float)RAND_MAX;
		for (const auto& a : cdf)
			if (a.second > x) {
				ex += a.first;
				vx += (a.first * a.first);
				break;
			}
		//cout << x << " " << ex << endl; // for debug
	}
	ex /= N;
	vx /= N;
	return vx - ex*ex;
}