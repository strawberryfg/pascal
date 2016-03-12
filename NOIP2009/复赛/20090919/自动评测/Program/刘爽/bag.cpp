#include<iostream>
#include<math.h>
#include<string>

using namespace std;

FILE *fin=fopen("bag.in","r");
FILE *fout=fopen("bag.out","w");

long n,i;

long f[1000003],s[1000003],e[1000003];

int main(){
  memset(f,0,sizeof(f));
  memset(s,0,sizeof(s));
  memset(e,0,sizeof(e));  
  f[0]=1;f[1]=s[1]=e[1]=1;
  fscanf(fin,"%ld",&n);
  for(i=2;i<=n;++i){
    s[i]=((s[i-1]+f[i-1])%997);
    f[i]=((s[i]+e[i-1]+s[i-1]+f[i-2])%997);
    e[i]=((f[i-1]+e[i-2])%997);
  }
  fprintf(fout,"%ld\n",f[n]);
  return 0;
}

