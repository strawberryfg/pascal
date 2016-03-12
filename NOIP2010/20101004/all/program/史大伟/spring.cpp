#include<iostream>
#include<string>
#include<cstdlib>
#include<cstdio>
using namespace std;
int main()
{
    freopen("spring.in","r",stdin);
    freopen("spring.out","w",stdout);
    int n,i,j,total,c,mark,min;
    cin>>n;
    int a[19][19],k[19],dist[19],q[19],temp;
    for(i=1;i<=n;i++)
        for(j=1;j<=n;j++)
        scanf("%d",&a[i][j]);
    mark=1;
    for(i=1;i<=n;i++)
      k[i]=0;
    k[1]=1;
    total=0;
    for(i=1;i<=n;i++)
    dist[i]=a[1][i];
    for(i=2;i<=n;i++)
       {
       min=10000000;
       c=mark;
       for(j=1;j<=n;j++)
           {
             if (dist[j]<min && k[j]==0&& c!=j)
                      {
                      min=dist[j];
                      mark=j;
                      } 
             }
        total=total+min;     
        k[mark]=1;     
        q[i-1]=min;
        for(j=1;j<=n;j++)
            if (a[mark][j]<dist[j])
                              dist[j]=a[mark][j];       
       }
    for(i=1;i<=n-1;i++)
        for(j=i+1;j<=n-1;j++)
        if (q[j]>q[i])  {
                       temp=q[j];
                       q[j]=q[i];
                       q[i]=temp;
                       }
    for(i=1;i<=n/2-1;i++)
    total=total-q[i];
    cout<<total<<endl;
}
