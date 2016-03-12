#include <stdio.h>
#include <stdlib.h>
FILE *fin,*fout;
int n,m,j,k,l,i,a[19][19],s[172][3],b[19],num;
long sum;
int main(int argc, char *argv[])
{  fin=fopen("spring.in","r");
   fout=fopen("spring.out","w");
   fscanf(fin,"%d",&n);
   l=1;
   for(i=1;i<=n;i++)
    for(j=1;j<=n;j++)
      {fscanf(fin,"%d",&a[i][j]);
      if(a[i][j]!=0)
      {s[l][0]=a[i][j];
      s[l][1]=i;
      s[l][2]=j;
      l++;}
      }
  for(i=1;i<l;i++)
    for(j=2;j<l;j++)
     if(s[i][0]>s[j][0])
      {
      for(m=0;m<=2;m++)
       {k=s[i][m];
       s[i][m]=s[j][m];
       s[j][m]=k; }                   
      }
  for(i=0;i<=18;i++)
    b[i]=0;
   num=n;
   sum=0;
   for(i=1;i<l;i++)
    if(num>0)
     if((b[s[i][1]]==0)&&(b[s[i][2]]==0))  
      {
       b[s[i][1]]=1;
       b[s[i][2]]=1;
       sum=sum+s[i][0];
       num=num-2;
       }
  fprintf(fout,"%ld\n",sum);

  return 0;
}
