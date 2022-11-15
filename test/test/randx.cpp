#include <iostream>
#include <ctime> 
#include <Windows.h>
using namespace std;

int main()
{
	srand(static_cast<unsigned int>(time(NULL)));
	for (int i = 0; i < 10; i++) cout << rand() << " ";
	cout << endl;
	Sleep(1000);

	srand(static_cast<unsigned int>(time(NULL)));
	for (int i = 0; i < 10; i++) cout << rand() << " " ;
	cout << endl;
	Sleep(1000);

	srand(static_cast<unsigned int>(time(NULL)));
	for (int i = 0; i < 10; i++) cout << rand() << " ";
	cout << endl;

	return 0;
}

