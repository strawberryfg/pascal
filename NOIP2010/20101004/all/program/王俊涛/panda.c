#include <stdio.h>
#include <stdlib.h>
FILE *fin,*fout;
int a[101],l,i,n,m,j,p1,min;
unsigned long b[100000],k;
int main(int argc, char *argv[])
{  fin=fopen("panda.in","r");
   fout=fopen("panda.out","w");
   fscanf(fin,"%d %ld",&n,&k);
   for(i=1;i<=n;i++)
    fscanf(fin,"%d",&a[i]);
    
   for(i=1;i<n;i++)
    for(j=2;j<=n;j++)
      if(a[i]>a[j])
        {
         l=a[i];
         a[j]=l;
         a[i]=a[j];                   
        }  
  
  for(i=1;i<=n;i++)
    {b[i]=a[i];
     for(j=1;j<=i-1;j++)
       for(m=1;m<=i-1;m++)
         if(b[j]*a[m]<b[i])
           push(b,i);
     }
  
  m=n; 
  while(b[m]!=0)
    m++;
  
  if(m>=k)
   {fprintf(fout,"%ld",b[k]);
    exit(0);}
  else 
   find(b,m);
  
 
    
  
	
  return 0;
}


int  push(unsigned long b[100000],int i)
{
  int s,d;
  s=i;
    while(b[s]!=0)
      s++;    
   for(d=s;d>=i;d--)     
     b[d+1]=b[d];
}


int  find(unsigned long b[100000],int p1)
  { 
  min=b[1]*b[1];
  for(i=1;i<=p1;i++)
    for(j=1;j<=p1;j++)
      if((min>b[i]*b[j])&&(b[i]*b[j]>b[p1]))
        min=b[i]*b[j];
  b[p1+1]=min;
  if(p1<k)
  find(b,p1+1);
  else 
   {fprintf(fout,"%ld",b[p1]);
    exit(0);}
  }
