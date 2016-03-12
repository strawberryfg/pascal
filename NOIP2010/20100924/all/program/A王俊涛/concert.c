#include <stdio.h>
#include <stdlib.h>
FILE *fin,*fout;
int i,j,k,l,p1,p2,s1,s2;
int sum1,sum2,cha;
int girl[301],boy[301];
int main(int argc, char *argv[])
{ fin=fopen("concert.in","r");
  fout=fopen("concert.out","w");
  fscanf(fin,"%d",&l);
  for(i=1;i<=l;i++)
    fscanf(fin,"%d",&girl[i]);
  for(i=1;i<=l;i++)
    fscanf(fin,"%d",&boy[i]);
  p1=1;
  p2=1;
  s1=1;
  s2=1;
  sum1=0;
  sum2=0;
  cha=0;
  while((p1<l)&&(p2<l))
  {while(boy[p2]==1)
    p2++;
   while(girl[p1]==1)
    p1++;
   sum1=boy[p2]*girl[p1];
   s1=p1+1;
   s2=p2+1;
   if((p2!=l)&&(p1!=l))
    {  for(j=1;j<p1;j++)
        cha=cha+girl[p1];
       sum1=sum1-cha*cha;
       cha=0; 
       for(j=1;j<p2;j++)
         cha=cha+boy[p2];
       sum1=sum1-cha*cha;
      }
    else  if(p1==l)
          {for(j=p2+1;j<=l;j++)
           cha=cha+boy[p2];
           sum1=sum1-cha*cha;
           cha=0;
           for(j=s1;j<p1;j++)
           cha=cha+girl[p1];
           sum1=sum1-cha*cha;
           }
          else if(p2==l)
           {
            for(j=p1+1;j<=l;j++)
             cha=cha+girl[p1];
             sum1=sum1-cha*cha; 
             cha=0;
            for(j=s2;j<p2;j++)
            cha=cha+boy[p2];
            sum1=sum1-cha*cha;       
           } 
  }
  
  for(j=1;j<=l;j++)
    sum2=sum2+boy[j]*girl[j];
    if(sum2>sum1)
     fprintf(fout,"%d\n",sum2);
     else fprintf(fout,"%d\n",sum1);
  return 0;
}
