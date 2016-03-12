#include <iostream>
#include <stdio.h>
#define MAX 10001
using namespace std;

long n,m,c;
long d[MAX];
long long f[MAX];

long sqr(long n){
     return n*n;
     }

main(){
       freopen("divide.in","r",stdin);
       freopen("divide.out","w",stdout);
       cin>>n>>m>>c;
       long i,j,l;
       for (i=1;i<=n;i++)
           scanf("%d",&d[i]);
       sort(d,d+n+1);
       for (i=m;i<=n;i++){
           f[i]=c+sqr(d[i]-d[1]);
           for (j=m+1;i-j+1>=m;j++)
               f[i]=min(f[i],c+sqr(d[i]-d[j])+f[j-1]);
           }
       cout<<f[n]<<endl;
       }
