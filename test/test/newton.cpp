#include <iostream>
//#include <cmath>
const float PI = 3.141592;
using namespace std;

float fx(float);
float dfxdx(float, float);
float findfx0(float);

float dx = 0.01;
float eta = 0.001;
int main() {
//    float x0 = 1.45;
//    float x1 = x0 + dx;
//    float psi = 0.03, eta = 0.01;
//    cout << "psi = " << psi << "\t" << "eta = " << eta << "\n";
    float x0 = 1.45;
    x0 = findfx0(1.45);
    cout << " at " << x0 << " fx = "  << fx(x0) << endl;
    return 1;
}

float fx(float x) {
    //return sinh(PI * x) * (cos(2 * PI * x) + 1);
    return x * (x - 2);
}

float dfxdx(float x) {
    return (fx(x + dx) - fx(x)) / dx;
}

float findfx0(float x0) {
    int iteration = 0;
    float x1;
    while (abs(fx(x0)) > eta && iteration++ < 200)   //fx(x0)값의 절댓값이 eta보다 크면 반복시행
    {
        x1 = x0 - fx(x0) / dfxdx(x0);
        x0 = x1;
    }
    cout << "  " << iteration << "  ";
    return x1;
}
