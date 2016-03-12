#include<iostream>

using namespace std;

long long n,k,v;
long long i,j;

long long f[100000],a[100000];

void qsort(int l,int r)
     {
          int i=l,j=r;long x=a[(l+r)/2],y;
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

long long minn(long long a,long long b)
    {
        if (a>b) return b;
           else return a;
    }

int main()
{
    freopen("divide.in","r",stdin);
    freopen("divide.out","w",stdout);
    
    cin>>n>>k>>v;
    for (i=1;i<=n;i++)
        {
            scanf("%d",&a[i]);
        }    
    qsort(1,n);
    for (i=1;i<=n;i++) f[i]=v+(a[i]-a[1])*(a[i]-a[1]);
    for (i=2*k;i<=n;i++)
        {
            for (j=k;j<=i-k;j++)
                {
                    f[i]=minn(f[i],f[j]+(a[i]-a[j+1])*(a[i]-a[j+1])+v);
                }
        }
    cout<<f[n]<<endl;
    return 0;
}
