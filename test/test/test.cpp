#include <iostream>
#include <fstream>
using namespace std;
int main() {
		int a = 2147483647; //2^31-1
		long long int b = (long long int)2147483647 + 2;
		cout << a << endl;
		cout << b << endl;
		cout << sizeof(long long int) << endl;

		
	float dt = 0.01, T = 0.1, t;
	int n = 0,*m,*j;
	for (t = 0; t < T; t += dt) cout << "  " << n++;
	cout << endl;
	t = dt * 10;
	m = (int*)&t; j = (int*)&T;
	cout << (hex) << *m << "  " << *j << endl;

	dt = 0.125; T = 1.25;
	n = 0;
	for (t = 0; t < T; t += dt) cout << "  " << n++;
	cout << endl;

	int** A;
	A = new int* [3];
	A[0] = new int[30];
	A[1] = new int[40];
	A[2] = new int[20];
	for (int i = 0; i < 3; i++) cout << sizeof(A[i]) << endl;
	cout << " A " << sizeof(A) << endl;
	int B[4];
	cout << " B " << sizeof(B) << endl;
	return 1;
}

/*
#include <sys/types.h>
#include <sys/stat.h>
using namespace std;
int main() {
	struct stat s;
	if (stat("a.dat", &s)) {
		cout << " error\n"; // error
	}
	cout << " size " << s.st_size << endl;
}	

	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
	int* data, **dd;
	data = new int[10];
	dd = new int*[3];
	for (int i = 0; i < 3; i++) dd[i] = new int[4+i];
	delete data;
	for (int i = 0; i < 3; i++) delete dd[i];
	delete [] dd;
	return 1;
}
class CTest {
public:
	CTest() { cout << "constructor" << endl; }
	~CTest() { cout << "destructor" << endl; }
private:
	int it;
};/*
int main() {
	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
	CTest* p = new CTest[2];
	//delete p;
	delete [] p;
	return 1;
}*/
	/*

	int i, ii[5];
	for (i = 0; i < 5; i++) ii[i] = i * 10;
	ofstream xx("a.dat", ios::binary | ios::out);
	xx.write((char*)&i, 4); // 4 or sizeof(int)
	xx.write((char*)(ii+2), 12); // 12 or 3*sizeof(int)
	xx.close();

	cout << "size of file " <<
		std::file_size("a.dat") << endl;

	ifstream yy("a.dat", ios::binary | ios::in);
	yy.seekg(0, ios::end);
	int length = yy.tellg();
	yy.seekg(0, ios::beg);
	cout << length << endl;
	short x;
	x = 40000;
	cout << " x = " << x << endl;
	x = -40000;
	cout << " x = " << x << endl;
	return 1;
}*/