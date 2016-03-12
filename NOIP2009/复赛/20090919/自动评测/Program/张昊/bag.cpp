#include<iostream>
#include<fstream>
using namespace std;
ifstream fin("bag.in");
ofstream fout("bag.out");
int a,b,c,s,sum,n,odd,even;
int main()
{
    fin>>n;
    a=1;b=1;c=5;
    odd=1;even=5;
    for (int i=3;i<=n;i++)
    {
        if (i%2)
        {
            s=(a*2+3*b+c+odd)%997;
            even=(s+odd)%997;
            a=b;b=c;c=s;
        }
        else 
        {
            s=(a*2+3*b+c+even)%997;
            even=(s+even)%997;
            a=b;b=c;c=s;     
        }
    }
    fout<<c<<endl;
    return 0;
}
