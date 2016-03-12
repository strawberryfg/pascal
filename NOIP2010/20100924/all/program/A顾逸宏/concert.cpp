#include<iostream>
using namespace std;
int ga[1000][1000];
int gb[1000][1000];
int f[1000][1000];
int n;
int a[1000];
int b[1000];
int main(){
    freopen("concert.in","r",stdin);
    freopen("concert.out","w",stdout);   
    cin>>n;
    for (int i=1;i<=n;i++)
        cin>>a[i];
    for (int i=1;i<=n;i++)
        cin>>b[i];
    for (int i=1;i<=n;i++)
        {
             ga[i][i]=a[i];
             for (int j=1;j<=n;j++)
                 ga[i][j]=ga[i][j-1]+a[j];
                 }
    for (int i=1;i<=n;i++)
        {
             gb[i][i]=b[i];
             for (int j=1;j<=n;j++)
                 gb[i][j]=gb[i][j-1]+b[j];
                 }
    for (int i=1;i<=n+1;i++)
        for (int j=1;i<=n+1;j++)
            {
                 for (int i1=1;i1<=i-1;i1++)
                     for (int j1=1;j1<=j-1;j1++)
                        {
                         if (f[i1][j1]+a[i]*b[j]-ga[i1][i]-gb[j1][j]>f[i][j])
                            f[i][j]=f[i1][j1]+a[i]*b[j]-ga[i1][i]-gb[j1][j];
                            }
                            }
    cout<<f[n+1][n+1];
    //system("pause");
}                                        
