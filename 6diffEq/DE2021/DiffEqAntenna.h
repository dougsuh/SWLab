#pragma once
#include <cmath>
using namespace std;
const float PI = 3.14159265;
class antenna {
public:
	antenna() {
	};
	antenna(float f,int n) {
		c = 3e8; // light speed
		omega = 2. * PI * f;
		k = omega / c;
		dt = 1. / f / 30; // 20 samples per period
		dr = c / f / 30;  // 30 samples per period
		tpoints = n;
		Io = 40;
		rlimit = dr * tpoints;
		t = 0;
		R = new float[tpoints];
	}
	int tpoints; // number of total points radially
	float *R;   //* values at time t-dt t t+dt 
	float c, omega, k, t, r, Io;
	float dr, dt, rlimit;

	void update()
	{
		// boundary condition 
		R[0] = Io * sin(omega * t) / 4;
		R[1] = R[0] - Io * cos(omega * t) / PI;
		// Update points along line for this time step 
		int nr;
		for (nr = 2,r = dr; nr < tpoints; r += dr,nr++) {           // location r
			R[nr] = R[nr-1] + (r - dr / 2) / (r + dr / 2) * (R[nr-1] - R[nr-2])
				- k * k * R[nr - 1] * r * dr * dr / (r + dr / 2);
		}
		t += dt;
	}
};