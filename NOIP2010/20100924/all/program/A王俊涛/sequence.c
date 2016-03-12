#include <stdio.h>
#include <stdlib.h>
FILE *fin,*fout;
unsigned int a[100001],b[100001];
int i,j,k,l,n,s;
unsigned long num;
int main(int argc, char *argv[])
{ fin=fopen("sequence.in","r");
  fout=fopen("sequence.out","w");
  fscanf(fin,"%d",&n);
  for(i=1;i<=n;i++)
    fscanf(fin,"%d",&a[i]);
  fclose(fin);
  s=a[1]-1;
  i=1;
  num=0;
  while(s<a[1])
   { 
    l=a[i]*2-s;            
    for(j=2;j<=n;j++)
      {
       k=a[j]*2-l;
       if(k<l)
         {
          fprintf(fout,"%d\n",num);
          exit(0);
         }
         else 
           {
            l=k;
            num++;      
           } 
      s--; 
      }             
   }
 	
  return 0;
}
