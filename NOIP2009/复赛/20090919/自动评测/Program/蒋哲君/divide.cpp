#include <iostream>
#include <fstream>
#define sqr(a) ((a)*(a))
using namespace std;

ifstream in ("divide.in");
ofstream out("divide.out");

int n,r;
long long c;
int a[12000];

void In() {

    in >> n >> r >> c;
    
    for (int i=1;i<=n;i++)
        in >> a[i] ;
        
    sort(a+1,a+n+1);

}

void work() {

    long long opt[13000];
    fill(opt,opt+13000,2147483647);
    
    opt[0]=0;
    
    for (int i=1;i<=n;i++) {

        long long Min=a[i],Max=a[i];

        for (int j=i;j>=1;j--) {

            Min<?=a[j];  Max>?=a[j];
            if (i-j+1<r) continue;
            opt[i]<?=opt[j-1]+sqr(Max-Min)+c;

        }

    }
    
    out << opt[n] << endl;

}

int main () {

    In();
    work();

}
