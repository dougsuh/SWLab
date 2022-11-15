#include <iostream>
#include <format>
#include<cmath>
using namespace std;

const float pi = 3.141592;

int main(){
    cout << scientific <<  0.0001*0.0001 << endl;
    short data[44100];
    for (int i = 0; i < 22050; i++)
    {
        float t = i * (1. / 44100);
        data[i * 2] = short(sin(2 * pi * 440 * t));
        data[(i * 2) + 1] = short(sin(2 * pi * 220 * t));
    }


}