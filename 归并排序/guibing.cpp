#include<iostream>
using namespace std;
const int maxn=100005;
int a[maxn]={0},i,n,temp[maxn];
  
void Init()
{
     int x,i;
     freopen("guibing.in","r",stdin);
     freopen("guibing.out","w",stdout);
     scanf("%d",&n);
     for (i=1;i<=n;i++) { scanf("%d",&a[i]); }    
}
void work(int l,int r)
{
     if(l==r)return;
     int mid=(l+r)/2;
     work(l,mid);
     work(mid+1,r);
     int p1=l,p2=mid+1,p3=l,i;
     while( p1<=mid&&p2<=r)
     if( a[p1]<a[p2])
     {
       
         temp[p3++]=a[p2++];
         }
     else temp[p3++]=a[p1++];
     while( p1<=mid)temp[p3++]=a[p1++];
     while( p2<=r)temp[p3++]=a[p2++];
     for( i=l;i<=r;i++)a[i]=temp[i];
}
int main()
{
    Init();
    work(0,n);
    for (i=0;i<=n;i++) printf("%d ",a[i]);
    printf("\n");
     return 0;
}
