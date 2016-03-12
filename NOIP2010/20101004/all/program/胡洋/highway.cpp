#include<cstdio>
#include<cstring>
#include<cstdlib>

const int maxn=100010;
inline int min(int a,int b){ return a<b?a:b;}
inline int max(int a,int b){ return a>b?a:b;}

int n,m,I;
int a[maxn];
int ans=0;

int main(){
    freopen("highway.in","r",stdin);
    freopen("highway.out","w",stdout);
    scanf("%d%d%d",&n,&m,&I);
    int i,j,k,l,r,o;
    for(i=1;i<=n;i++) a[i]=I;
    while(m--){
        scanf("%d",&i);
        
        scanf("%d%d%d",&l,&r,&k);
        if(i==1){
            for(j=l;j<=r;j++)
                if(a[j]<k) break;
            if(j>r){
                ans++;
                for(o=l;o<=r;o++)
                    a[o]-=k;
            }
        }
        
        
        if(i==2){
            for(j=l;j<=r;j++)
                if(a[j]>0) a[j]+=k;
        }
        if(i==3){
            for(j=1;j<=r;j++)
                if(a[j]>0&&a[j]<k) a[j]=k;
        }
    }
    
    printf("%d\n",ans);
    return 0;
}
