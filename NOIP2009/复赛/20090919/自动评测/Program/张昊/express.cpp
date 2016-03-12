#include<iostream>
#include<fstream>
using namespace std;
ifstream fin("express.in");
ofstream fout("express.out");
int f[100][1000],s[1000],hash[10000],n,x,y,i,t;
int sum(int x)
{
    int t=x%10;
    x/=10;
    while (x)
    {
        t+=x%10;
        x/=10;
    }
    return t;
}
int getmin(int x)
{
    int t=x%10;
    x/=10;
    while (x)
    {
        if (x%10<t) t=x%10;
        x/=10;
    }
    return t;
}
int getmax(int x)
{
    int t=x%10;
    x/=10;
    while (x)
    {
        if (x%10>t) t=x%10;
        x/=10;
    }
    return t;
}

int work(int x,int y)
{
    return sum(x)*getmax(y)+getmin(y);
}
int main()
{
    fin>>n;
    while (n)
    {
        fin>>x>>y;
        hash[x]=1;
        memset(f,0,sizeof(f));
        memset(s,0,sizeof(s));
        memset(hash,0,sizeof(hash));
        hash[x]=0;
        s[0]=1;
        f[0][1]=x;
        i=0;
        if (y<1000)
        while (i<=100 && (!hash[y]))
        {
            i++;
            for (int j=0;j<=i-1;j++)
               for (int k=1;k<=s[j];k++)
                 for (int l=1;l<=s[i-1-j];l++)
            {
                t=work(f[j][k],f[i-1-j][l]);
                if (!hash[t]) 
                {
                    s[i]++;
                    f[i][s[i]]=t;
                    hash[t]=i;
                }
                t=work(f[i-1-j][l],f[j][k]);
                if (!hash[t]) 
                {
                   s[i]++;
                   f[i][s[i]]=t;
                   hash[t]=i;
                }
            } 
        }
        if (hash[y]) fout<<hash[y]<<endl;
        else fout<<-1<<endl;
        n--;

    }
    
    return 0;
}
