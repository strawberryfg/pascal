#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <string.h>
using namespace std;


int a[27],s[27];
bool v[27];

void run()
{
    int tmp='A'; 
    for (int i=1; i<=26; ++i)
    {   
        int tt;
        tt=getchar();
        a[i]=tt-tmp+1;
    }
    scanf("\n");
    
    memset(v,0,sizeof(v));
    memset(s,0,sizeof(s));
    for (int i=1; i<=26; ++i) if (v[i]==0)
    {
        int cnt=0,now=i;
        do
        {
            v[now]=1;
            ++cnt;
            now=a[now];  
        }while (v[now]==0);
        if (cnt%2==0) ++s[cnt];
    }      
    bool flag=1;
    for (int i=2; i<=26; ++i,++i) 
        if (s[i]%2!=0)
        {
            flag=0;
            break;          
        } 
    (flag==1) ? printf("Yes\n"):printf("No\n");
}


int main()
{
    freopen("game.in","r",stdin);
    freopen("game.out","w",stdout);
    int testnum;
    scanf("%d\n",&testnum);
    for (int i=1; i<=testnum; ++i)
        run();
    return 0;
}
