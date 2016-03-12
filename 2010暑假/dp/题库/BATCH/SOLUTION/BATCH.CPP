#include<fstream.h>
#include<string.h>

ifstream fin("batch.in");
ofstream fout("batch.out");

int t[10001],f[10001],c[10001];
int n,s;

int main() {
	fin>>n>>s;
	int i,k;
	for (i=1;i<=n;i++)
		fin>>t[i]>>f[i];
	for (i=1;i<=n;i++) {
		t[i]+=t[i-1];
		f[i]+=f[i-1];
		c[i]=2147483647;
	}
	int temp;
	for (k=1;k<=n;k++)
		for (i=1;i<=k;i++) {
			temp=c[i-1]+s*(f[n]-f[i-1])+t[k]*(f[k]-f[i-1]);
			if (c[k]>temp)
				c[k]=temp;
		}
	fout<<c[n]<<endl;
	return 0;
}
