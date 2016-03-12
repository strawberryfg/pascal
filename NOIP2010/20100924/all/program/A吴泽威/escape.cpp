#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;
#define oo 1000000000
struct node1{int a,b;}v[310];
struct node2{int a,b,c,d;}q[100010];
int d[310][310];
int p[310],ans[100010];
int cmp1(const node1 &a,const node1 &b){
    return a.a<b.a;
}
int cmp2(const node2 &a,const node2 &b){
    return a.c<b.c;
}

int main(){
    freopen("escape.in","r",stdin);
    freopen("escape.out","w",stdout);
    int n,m;
    cin>>n>>m;
    for (int i=1;i<=n;i++){cin>>v[i].a; v[i].b=i;}
    sort(v+1,v+n+1,cmp1);
    for (int i=1;i<=n;i++) p[v[i].b]=i;
    for (int i=1;i<=n;i++)
    for (int j=1;j<=n;j++)
        d[i][j]=oo;
    for (int i=1;i<=n;i++) d[i][i]=0;
//cout<<"----p-----\n";
//for (int i=1;i<=n;i++) cout<<p[i]<<' '; cout<<endl;
    while (m--){
        int x,y,z;
        scanf("%d%d%d",&x,&y,&z);
        x=p[++x];
        y=p[++y];
        if (z<d[x][y]){d[x][y]=z; d[y][x]=z;}
    }
    cin>>m;
    for (int i=1;i<=m;i++){
        scanf("%d%d%d",&q[i].a,&q[i].b,&q[i].c);
        q[i].a=p[++q[i].a];
        q[i].b=p[++q[i].b];
        q[i].d=i;
    }
    sort(q+1,q+m+1,cmp2);
    for (int i=1;i<=m;i++) ans[i]=-1;
    int now=0;
    q[m+1].c=oo;
//for (int i=1;i<=m;i++) cout<<q[i].a<<' '<<q[i].b<<' '<<q[i].c<<endl;
//for (int i=1;i<=n;i++){
//for (int j=1;j<=n;j++) cout<<d[i][j]<<' '; cout<<endl;}
    for (int k=1;k<=n;k++){
        while (q[now+1].c<v[k].a){
            now++;
            //cout<<now<<' '<<k-1<<endl;
            if (d[q[now].a][q[now].b]<oo) ans[q[now].d]=d[q[now].a][q[now].b];
        }
        for (int i=1;i<=n;i++)
        for (int j=1;j<=n;j++)
            if (d[i][k]+d[k][j]<d[i][j]) d[i][j]=d[i][k]+d[k][j];
//cout<<"after "<<k<<;
//for (int i=1;i<=n;i++){
//for (int j=1;j<=n;j++) cout<<d[i][j]<<' '; cout<<endl;}
    }
    while (now<m){
        now++;
        if (d[q[now].a][q[now].b]<oo) ans[q[now].d]=d[q[now].a][q[now].b];
    }
    for (int i=1;i<=m;i++) printf("%d\n",ans[i]);
//system("pause");
}
/*
5 5
100 2 2 3 100
0 1 1
1 2 2
2 4 2
1 3 1
3 4 1
3
0 4 3
0 4 2
0 4 1

*/

