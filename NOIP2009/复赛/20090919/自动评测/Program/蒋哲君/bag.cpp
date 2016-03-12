#include<iostream>
#include<fstream>
using namespace std;

ifstream in ("bag.in");
ofstream out("bag.out");

int n,m,p,s;
int g[40][40];

void init(int a, int b, int k){
    if (k>m) return;
    if (k==m){
        g[a][b]+=1;
        return;
    }
    init(a<<2,b<<2,k+2);
    init(a<<1,(b<<1)|1,k+1);
    init((a<<1)|1,b<<1,k+1);
}
void up(int a[40][40],int b[40][40],int c[40][40]){
    int r[40][40];
    memset(r,0,sizeof(g));
    for (int i=0;i<s;i++)
        for (int j=0;j<s;j++)
            for (int k=0;k<s;k++)
                r[i][j]=(r[i][j]+a[i][k]*b[k][j]%p)%p;
    memcpy(c,r,sizeof(g));
}
int main(){
    m=4; p=997;
    in >> n ;
    s=(1<<m);
    init(0,0,0);
    int ans[40][40];
    memset(ans,0,sizeof(ans)); ans[0][0]=1;
    while (n){
        if (n%2) up(ans,g,ans);
        n/=2;
        up(g,g,g);
    }
    out << ans[0][0] << endl;
}
