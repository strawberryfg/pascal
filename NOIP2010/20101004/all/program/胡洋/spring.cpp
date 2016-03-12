#include<cstdio>
#include<cstring>
#include<cstdlib>

const int maxn=22;
inline int min(int a,int b) {return a<b?a:b;}

int n;
int ti[maxn][maxn];
int ans;
int sui;
bool u[maxn];
int now,p;
int minimum;

void search(int x){
    if(now>=ans) return;
    if(x==0) {ans=now;return;}
    if(now+minimum>=ans) return;
    u[x]=1;
    int i,j,k;
    for(i=1;i<=n;i++)if(u[i]==0){
        now+=ti[x][i];
        u[i]=1;
        for(j=1;j<=n;j++) if(u[j]==0){search(j);break;}
        if(j>n) search(0);
        u[i]=0;
        now-=ti[x][i];
    }
    u[x]=0;
}

int main () {
    freopen("spring.in","r",stdin);
    freopen("spring.out","w",stdout);
    scanf("%d",&n);
    int i,j,k,l,r,x,y;
    ans=0;
    minimum=2100000000;
    for(i=1;i<=n;i++)
        for(j=1;j<=n;j++){
            scanf("%d",&ti[i][j]);
            if(ti[i][j])
            minimum=min(minimum,ti[i][j]);
        }
    for(i=1;i<=n/2;i++)
        ans+=ti[i*2-1][i*2];
    srand(19940505);
    sui=rand();
    for(r=0;r<25000;r++){
        now=0;
        srand(sui);
        sui=rand();
        for(i=1;i<=n;i++) u[i]=0;
        for(k=1;k<=n/2;k++){
            x=rand()%n+1;
            while(u[x]) x=rand()%n+1;
            u[x]=1;
            y=rand()%n+1;
            while(u[y]) y=rand()%n+1;
            u[y]=1;
            now+=ti[x][y];
            if(now>=ans) break;
        }
       // printf("%d\n",now);
        ans=min(ans,now);
    }
    memset(u,0,sizeof u);now=0;p=0;
    //printf("%d\n",ans);
    //ans=2000000000;
    search(1);
    printf("%d\n",ans);
    return 0;
}
