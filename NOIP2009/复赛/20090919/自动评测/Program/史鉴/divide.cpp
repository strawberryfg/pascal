#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<algorithm>
#include<vector>
#include<queue>
#include<cctype>
#include<cmath>
using namespace std;

long long f[20000],aa[20000];
int st[20000][4],m;

void sort(int l,int r)
{
  int i=l,j=r,x=aa[(l+r)/2];
  
  do{
    while (aa[i]<x) i++;
    while (aa[j]>x) j--;
    if (i<=j)
      {
        swap(aa[i],aa[j]);
        i++;
        j--;
      }
  }
  while (i<=j);
  
  if (i<r) sort(i,r);
  if (l<j) sort(l,j);
}

int find(int x)
{
  int l=1,r=m,mid;

  while (l<=r)
    {
      mid=(l+r)/2;
      if (st[mid][1]<=x && st[mid][2]>=x) return mid;
      if (st[mid][2]<x) l=mid+1; else r=mid-1;
    }  
}

int main(){
    
  int n,k,kk,c,i,j,tmp,l,r,ans,mid;
  long long a,b;
  
  freopen("divide.in","r",stdin);
  freopen("divide.out","w",stdout);
  
  scanf("%d %d %d",&n,&kk,&c);
  
  for (i=1; i<=n; i++) scanf("%I64d",&aa[i]);
  sort(1,n);
    
  memset(st,0,sizeof(st));
  m=1;
  st[1][0]=0;
  st[1][1]=kk+1;
  st[1][2]=n;
  f[kk]=(aa[kk]-aa[1])*(aa[kk]-aa[1])+c;
  i=1;
  
  l=kk+1; r=n; ans=-1;
  while (l<=r)
    {
      mid=(l+r)/2;
      k=find(mid);
      a=f[i]+c+(aa[mid]-aa[i+1])*(aa[mid]-aa[i+1]);
      b=f[st[k][0]]+c+(aa[mid]-aa[st[k][0]+1])*(aa[mid]-aa[st[k][0]+1]);
      if (a<b)
        {
          ans=mid;
          r=mid-1;
        }
      else 
      l=mid+1;
    }
    
  if (ans!=-1) 
    {
      k=find(ans);
      if (ans==st[k][1])
        {
          m=k;
          st[m][0]=i;
          st[m][1]=ans;
          st[m][2]=n;
        }
      else
        {
          m=k+1;
          st[m][0]=i;
          st[m][1]=ans;
          st[m][2]=n;
          st[k][2]=ans-1;
        } 
    }
    
  for (i=kk+1; i<=n; i++)
    {
      if (i-kk<kk) f[i]=(aa[i]-aa[1])*(aa[i]-aa[1])+c; 
      else
        {
          k=find(i);
          tmp=st[k][0];
          f[i]=f[tmp]+c+(aa[i]-aa[tmp+1])*(aa[i]-aa[tmp+1]);
        }    
      
      l=i+kk; r=n; ans=-1;
      while (l<=r)
        {
          mid=(l+r)/2;
          k=find(mid);
          a=f[i]+c+(aa[mid]-aa[i+1])*(aa[mid]-aa[i+1]);
          b=f[st[k][0]]+c+(aa[mid]-aa[st[k][0]+1])*(aa[mid]-aa[st[k][0]+1]);
          if (a<b)
            {
              ans=mid;
              r=mid-1;
            }
          else 
            l=mid+1;
        }
      if (ans!=-1) 
        {
          k=find(ans);
          if (ans==st[k][1])
            {
              m=k;
              st[m][0]=i;
              st[m][1]=ans;
              st[m][2]=n;
            }
          else
            {
              m=k+1;
              st[m][0]=i;
              st[m][1]=ans;
              st[m][2]=n;
              st[k][2]=ans-1;
            } 
        }
    }
    
  cout<<f[n]<<endl;
}
