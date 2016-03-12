#include <stdio.h>
#include <fstream>
#include <string>

using namespace std;

ifstream fin("argus.in");
ofstream fout("argus.out");

struct Td
{
	int id,period;
	int time;
};

Td d[1005];
bool cmp(Td a, Td b)
{
   return a.id<b.id;
}

int n,k;
void init();
void work();

int main()
{
	init();
    work();
	return 0;
}

void de()
{
   for (int i=0; i<n; i++);
}

void init()
{
	string s;
	n=0;
	for (fin>>s; s != "#"; fin>>s)
    {
       fin>>d[n].id>>d[n].period;
	   d[n].time=d[n].period;
	   n++;
	}
   fin>>k;
   sort(d,d+n,cmp);
}

void work()
{
    for (int i=0; i<k; i++)
	{
       int min=0;
	   for (int j=0; j<n ; ++j )
		   if (d[j].time<d[min].time) 
		      min=j;
        fout<<d[min].id<<endl;
		d[min].time+=d[min].period;
	}
}

