#include <stdio.h>
#include <stdlib.h>
FILE *fin,*fout;
unsigned long n,num,m;
int i,j,k,l;
unsigned long a[10000000];
int main(int argc, char *argv[])
{  fin=fopen("sugar.in","r");
   fout=fopen("sugar.out","w");
   fscanf(fin,"%ld",&n);
   a[1]=3;
   a[2]=6;
   a[3]=10;
   a[4]=15;
   a[5]=21;
   if(n>5)
     for(i=6;i<=n;i++)
       a[i]=a[i-2]+a[i-5]+10;
  fprintf(fout,"%d\n",a[n]);     
   	
  return 0;
}
