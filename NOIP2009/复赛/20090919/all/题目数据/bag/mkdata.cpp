#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cstring>

using namespace std;

void	make(int nCase, int N)
{
	ostringstream	os;
	os << "bag" << nCase << ".in";
	
	ofstream	fou(os.str().c_str());

	fou << N << endl;
}

int	main()
{
	make(0, 4);
	make(1, 99);
	make(2, 317);
	make(3, 998);
	make(4, 10000);
	make(5, 637897);
	make(6, 1000000);
	make(7, 68584836);
	make(8, 129347555);
	make(9, 1000000000 - 84);
	return 0;
}
