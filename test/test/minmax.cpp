#include <iostream>
const float g = 9.800;
using namespace std;
void calculate_x(float);
float shpere(float);
int main() {
	float ddt = 1.;
	for (int i = 0; i < 5; i++) {
		calculate_x(ddt);
		ddt *= 0.125;
	}
	cout << shpere(2) << endl;
	return 1;
}
void calculate_x(float dt) {
	float t, T = 10, v, xbar, errorinpercent;
	xbar = 0;
	for (t = 0; t < T; t += dt) {
		xbar += g * (t + dt / 2) * dt;
	}
	errorinpercent = fabs(490.0 - xbar) / 490.0 * 100.0;
	cout << "dt " << dt << " x=490 " << xbar << " error " << errorinpercent << "%\n";
	cout << " t " << scientific << t << endl;
};
float shpere(float R) {
	float vol = 0.0, dt = 0.125/8, r2 = R / 2, dt3 = dt*dt*dt;
	for (float z = 0; z < R; z += dt) {
		float YR = sqrt(R * R - z * z);
		for (float y = 0; y < YR; y += dt) {
			float XR = sqrt(R * R - z * z - y*y);
			for (float x = 0; x < XR; x += dt) {
				vol += dt3;
			}
		}
	}
	return 8 * vol;
}
