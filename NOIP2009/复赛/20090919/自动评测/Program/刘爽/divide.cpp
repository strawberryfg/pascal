#include<iostream>
#include<math.h>
#include<string>

using namespace std;

FILE *fin=fopen("divide.in","r");
FILE *fout=fopen("divide.out","w");

long long n,k,c,i,j,a[10003],f[10003];

void qsort(long long l,long long r)
     {
          long long i=l,j=r,x=a[(l+r)/2],y;
          do{
              while (a[i]<x) i++;
              while (x<a[j]) j--;
              if (i<=j)
              {
                 swap(a[i],a[j]);
                 i++;j--;
              }
          }while (i<=j);
          if (l<j) qsort(l,j);
          if (i<r) qsort(i,r);
     }

int main(){
  fscanf(fin,"%ld%ld%ld",&n,&k,&c);
  for(i=1;i<=n;++i) 
    fscanf(fin,"%ld",a+i);
  qsort(1,n);
  f[0]=0;
  for(i=1;i<=n;++i){
   f[i]=c+(a[i]-a[1])*(a[i]-a[1]);      
   if(k<=i-k){
     for(j=k;j<=i-k;++j){
      if(f[j]+c+(a[i]-a[j+1])*(a[i]-a[j+1])<f[i])
       f[i]=f[j]+c+(a[i]-a[j+1])*(a[i]-a[j+1]);
     }    
   }
  }
  fprintf(fout,"%ld\n",f[n]);
  return 0;
}
