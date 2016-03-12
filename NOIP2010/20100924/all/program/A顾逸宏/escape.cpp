#include<iostream>
using namespace std;
int n,m,ans;
bool bl[10000];
int xx[10000];
int g[1000][1000];
int t[1000];
int a[1000];
int r;

int SPFA(int u,int v,int w)
{
    bool xxx;
    int min=2147483647;
    int l;
    for (int i=1;i<=n;i++)
        {
            if (a[i]<=w)
               bl[i]=true;
               else bl[i]=false;
               }
    bl[v]=true;
    bl[u]=false;
    l=1;r=1;xx[l]=u;
    t[u]=0;xxx=false;
    while (l<=r)
          {
                for (int i=1;i<=n;i++)
                     if (g[xx[l]][i]!=0 && (bl[i] || i==v))
                        {
                                        
                             r++;
                             xx[r]=i;
                             
                             t[r]=t[l]+g[xx[l]][i];
                             
                             if (i==v) 
                               {
                                       xxx=true;
                                       if (t[r]<min)
                                           min=t[r];
                                           }

                             
                             bl[i]=false;
                             }    
               l++;
               }
    if (xxx)
        return min;
        else
    return -1;
}    
using namespace std;
int main(){
    freopen("escape.in","r",stdin);
    freopen("escape.out","w",stdout);   
    int x,y,w,p;
    cin>>n>>m;
    for (int i=1;i<=n;i++)
        cin>>a[i];
    for (int i=1;i<=m;i++)
        {
             cin>>x>>y>>w;
             x++;y++;
             g[x][y]=w;
             g[y][x]=w;
             }
    cin>>p;
    int u,v;
    for (int i=1;i<=p;i++)
        {
              cin>>u>>v>>w;
             ans=SPFA(u+1,v+1,w);
             cout<<ans<<endl;
             }
    //system("pause");
}
    
