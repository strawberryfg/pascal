#include <iostream.h>
#include <fstream.h>

ifstream fin("stick.in");
ofstream fout("stick.out");
int l[1001],w[1001],pl[1001],pw[1001];
int n,p;

void main() {
     int i,j,t;
     fin>>n;
     for (i=1;i<=n;i++) fin>>l[i]>>w[i];
     for (i=1;i<n;i++)
	 for (j=i+1;j<=n;j++)
	     if (l[i]<l[j]||(l[i]==l[j]&&w[i]<w[j])) {
		t=l[i];
		l[i]=l[j];
		l[j]=t;
		t=w[i];
		w[i]=w[j];
		w[j]=t;
	     }
     p=0;
     for (i=1;i<=n;i++) {
	 for (j=1;j<=p;j++)
	     if (pl[j]>=l[i]&&pw[j]>=w[i])
		break;
	 if (pl[j]>=l[i]&&pw[j]>=w[i]) {
	    pl[j]=l[i];
	    pw[j]=w[i];
	 } else {
	    pl[++p]=l[i];
	    pw[p]=w[i];
	 }
     }
     fout<<p<<endl;
}
