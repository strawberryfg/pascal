#include<iostream>
using namespace std;
int now[100005];
int main(){
    int n,m,tot,ans,i,j,l,f,t,d;
    bool pd;
    freopen("highway.in","r",stdin);
    freopen("highway.out","w",stdout);
    cin>>n>>m>>tot; ans=0;
    for (i=0;i<n;i++) now[i]=tot;
    for (i=0;i<m;i++){
        scanf("%d%d%d%d",&l,&f,&t,&d);
        f--; t--;
        if (l==1){
           pd=false;
           for (j=f;j<=t;j++)
               if (now[j]<=0) pd=true;
           if (!pd){
              for (j=f;j<=t;j++) now[j]-=d;
              ans++;
           }
        } else
        if (l==2){
           for (j=f;j<=t;j++)
               if (now[j]>0) now[j]+=d;
        } else
        {
              for (j=f;j<=t;j++)
                  if (now[j]>0) now[j]>?=d;
        }
    }
    cout<<ans<<endl;
    return 0;
}
