#include<cstdlib>
#include<cstdio>
#include<iostream>
#include<fstream>
#include<cmath>
#include<string>
using namespace std;
struct node{
    int l,r,s;
}a[11],b[11];
int pd1(int i)
{
    if (b[i].s>0 && a[i].s>0) return 1;
  if (i!=1)
  {
  if (b[i+1].s>1 || b[i-1].s>1) return 1;
  if (b[i+1].s==1 && a[i+1].s==0) return 1;
  if (b[i-1].s==1 && a[i-1].s==0) return 1;
  }
  if (i==1)
  {
  if (b[i+1].s>1) return 1;
  if (b[i+1].s==1 && a[i+1].s==0) return 1;
}
}
int pd(int i)
{
  int t,p,k;
  if (a[i].s>0 && b[i].s>0) return 1;
  if (i!=1)
  {
  if (a[i+1].s>1 || a[i-1].s>1) return 1;
  if (a[i+1].s==1 && b[i+1].s==0) return 1;
  if (a[i-1].s==1 && b[i-1].s==0) return 1;
  }
  if (i==1)
  {
  if (a[i+1].s>1) return 1;
  if (a[i+1].s==1 && b[i+1].s==0) return 1;
  }
  return 0;
}
int main()
{
   freopen("friends.in","r",stdin);
   freopen("friends.out","w",stdout);
   int j,i,t,t1;
   t=0;  
   int n;
   cin>>n;
   char k[1000],f[1000];
   for(i=1;i<=n;i++)
       {
        for(j=0;j<=10;j++)
       {
        a[j].s=0;
        b[j].s=0;
       }
       scanf("%s%s",&k,&f);
       for(j=1;j<=strlen(k);j++)
          {
          b[k[j-1]-48].s++;
           if (b[k[j-1]-48].s==1)
                              {
                               if (j!=1)
                               b[k[j-1]-48].l=k[j-2]-48;
                               if (j!=strlen(k))
                               b[k[j-1]-48].r=k[j]-48;  
                               }
          }
       for(j=1;j<=strlen(f);j++)
           {
          a[f[j-1]-48].s++;
           if (a[f[j-1]-48].s==1)
                              {
                               if (j!=1)
                               a[f[j-1]-48].l=f[j-2]-48;
                               if (j!=strlen(f))
                               a[f[j-1]-48].r=f[j]-48;  
                              }
           }
       for(j=0;j<=9;j++)
           {
           if (b[j].s>0 && a[j].s>0)
                                      t=1;
                              else
                                 if (a[j].s==b[j].s)
                                      t=1;
                                 else {t=0;break;}
           }
       if (t==1) {
                 cout<<"friends"<<endl;
                 continue;
                 } 
       for(j=0;j<=9;j++)
          {
          if (b[j].s>0 && a[j].s==0)
                            {
                            if (pd(j)) 
                                         t=2;
                                  else
                                  {
                                  t=0;
                                  break;
                                  }
                            }
          }
      
       if (t==2) cout<<"almost friends"<<endl;
                 else 
                 cout<<"nothing"<<endl;
       }   
}
