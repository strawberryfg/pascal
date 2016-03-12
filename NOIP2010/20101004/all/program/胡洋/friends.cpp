#include<cstdio>
#include<cstring>
#include<cstdlib>

const int maxn=200;

char a[maxn],b[maxn];
int x[maxn],y[maxn],lx,ly;
bool ux[12],uy[12];
bool find;

void doit(){
    int i;
    memset(ux,0,sizeof ux);
    memset(uy,0,sizeof uy);
    for(i=1;i<=lx;i++) ux[x[i]]=1;
    for(i=1;i<=ly;i++) uy[y[i]]=1;
}

bool ok(){
    int i;
    for(i=0;i<10;i++) if(ux[i]!=uy[i]) return 0;
    return 1;
}

int main () {
    freopen("friends.in","r",stdin);
    freopen("friends.out","w",stdout);
    
    int n,m,i,j,k;
    scanf("%d",&n);
    while(n--){
        scanf("%s%s",a,b);
        lx=strlen(a);ly=strlen(b);
        memset(ux,0,sizeof ux);
        memset(uy,0,sizeof uy);
        //printf("%d %d\n",lx,ly);
        //printf("%s %s\n",a,b);
        //1
        for(i=0;i<lx;i++) {
            x[i+1]=a[i]-'0';
        }
        for(i=0;i<ly;i++) {
            y[i+1]=b[i]-'0';
        }
        doit();
        if(ok()) {
            printf("friends\n");
            continue;
        }
        find=0;
        for(i=1;i<ly;i++){
            y[i]++,y[i+1]--;
            if(x[i]<10&&x[i]>=0&&y[i+1]<10&&y[i+1]>=0&&x[1]!=0&&y[1]!=0) {
                doit();
                if(ok()) find=1;
            }
            y[i]--;y[i+1]++;
            if(find)break;
        }
        for(i=1;i<lx;i++){
            x[i]--,x[i+1]++;
            if(x[i]<10&&x[i]>=0&&y[i+1]<10&&y[i+1]>=0&&x[1]!=0) {
                doit();
                if(ok()) find=1;
            }
            x[i]++;x[i+1]--;
            if(find)break;
        }
        if(find) printf("almost friends\n");
        else printf("nothing\n");
    }
    
    return 0;
}
