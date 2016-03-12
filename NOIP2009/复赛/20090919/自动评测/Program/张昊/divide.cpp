#include<iostream>
#include<fstream>
using namespace std;
ifstream fin("divide.in");
ofstream fout("divide.out");
int p[10001],n,k,c;
__int64 dp[10001],s;
void sort(int l,int r)
{
    int i=l,j=r,x=p[(l+r)/2];
    while (i<=j)
    {
        while (x>p[i]) i++;
        while (x<p[j]) j--;
        if (i<=j)
        {
            x = p[i];
            p[i] = p[j];
            p[j] =x;
            i++;
            j--;
        }
    }
    if (i<r) sort(i,r);
    if (l<j) sort(l,j);
}
int main()
{
    memset(dp,127,sizeof(dp));
    fin>>n>>k>>c;
    for (int i=1;i<=n;i++)
        fin>>p[i];
    sort(1,n);
    dp[0]=0;
    for (int i=k;i<=n;i++)
    {
        dp[i]=dp[i-k]+c;
        for (int j=i-k-1;j>0;j--)
        {
            s=(p[i]-p[j])*(p[i]-p[j])+c+dp[j-1];
            if (s<dp[i]) dp[i]=s;
            if ((p[i]-p[j])*(p[i]-p[j])>dp[i]) break;
        }
    }
    fout<<dp[n]<<endl;
    return 0;
}
