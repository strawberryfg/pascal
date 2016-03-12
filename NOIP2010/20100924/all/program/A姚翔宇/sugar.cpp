// Program : sugar

#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cstring>
using namespace std;

long long ans;
int main()
{
    freopen("sugar.in", "r", stdin);
    freopen("sugar.out", "w", stdout);
    
    int n;
    scanf("%d", &n);
    if (n % 2 == 0)
    {
        ans = (n + 4) / 2;
        ans = ans * (n - 1) + 3;
    }
    else
    {
        ans = (n - 1) / 2;
        ans = ans * (n + 4) + 3;
    }
    printf("%I64d\n", ans);
    return 0;
}
    
