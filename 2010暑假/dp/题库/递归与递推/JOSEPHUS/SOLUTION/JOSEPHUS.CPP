#include <fstream.h>
const int max = 32768;
void main()
{
	int n,i,jose[max],final[max];
	jose[1] = 1;
	final[1] = 1;
	for (i = 2; i<max; i++) 
	{
		jose[i] = (jose[i-1] + 1) % i + 1;
		if (jose[i] == i) final[i] = i;
		else final[i] = final[jose[i]];
	}
	while (1)
	{
		cin>>n;
		if (cin.fail()) break;
		cout<<final[n]+n<<endl;
	}
}