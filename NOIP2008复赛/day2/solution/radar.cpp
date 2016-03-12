#include <stdio.h>
#include <fstream>
#include <iostream>

using namespace std;
ifstream fin("radar.in");
ofstream fout("radar.out");

int a,b,c;
double ans;

int main(int argc, char *argv[])
{
    fin>>a>>b>>c;
	int sum,count,x;
	count=sum=0;
	for (int i=0; i<c; i++)
	{
		fin>>x;
		if (x>=a && x<=b ) 
		{
			count++;
		    sum+=x;
		}
	}
	if ((c-count)*10>c) fout<<"0.0"<<endl;
	else fout<<(1.0*sum)/double(count)<<endl;

	return 0;
}
