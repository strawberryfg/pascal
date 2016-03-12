#include <stdio.h>
#include <stdlib.h>
FILE *fin,*fout;
long n,m,k,p,num,s;
int a[100001],y,u,i,o,j,t;
int main(int argc, char *argv[])
{ fin=fopen("highway.in","r");
  fout=fopen("highway.out","w");
  fscanf(fin,"%ld %ld %d",&n,&m,&j);
  for(k=1;k<=n;k++)
    a[k]=j;
  num=0;
 
  for(k=1;k<=m;k++)
  { t=0;
    fscanf(fin,"%d %d %d %d",&y,&u,&i,&o);                 
    if(y==1)
      for(p=u;p<=i;p++)
        if(a[p]<=0)
          {t=0;
          break;}
          
        else 
          {a[p]=a[p]-o;
          t=1;}
          
    if(t==1)
       num++; 
                       
    if(y==2)
      for(p=u;p<=i;p++)
        a[p]=a[p]+o;
        
    if(y==3)
     for(p=u;p<=i;p++)               
       if(a[p]<o)
         a[p]=o;            
  }
  
 fprintf(fout,"%ld\n",num);

  return 0;
}
