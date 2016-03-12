#include <cstring>
#include <cstdio>
#include <algorithm>

using namespace std;

const int maxn=200000+1;
int n,m,tot,cnt,l,len;
bool vis[maxn];
int heap[maxn*4],line[maxn],Lnkhead[maxn];
int rank[maxn],head[maxn],sure[maxn],ans[maxn];
double value[maxn];
struct point{
    int data,next;
} mem[maxn*2];
struct node{
    double data;
    int lnk;
} dic[maxn];
struct cmp{
    bool operator()(const node &a,const node &b){
        return (a.data<b.data);
    }
};

void swap(int &a,int &b){
    int t=a;
    a=b;
    b=t;
}
void Put_Heap(int k){
    heap[++tot]=k;
    int sn=tot;
    while (sn>1){
        int fa=sn/2;
        if (sure[heap[fa]]<sure[heap[sn]]){
                swap(heap[fa],heap[sn]);
                rank[heap[sn]]=sn;
                sn=fa;
        }
        else break;
    }
    rank[heap[sn]]=sn;
}
void Get_Heap(int &k){
    k=heap[1];
    heap[1]=heap[tot--];
    int fa=1;
    while (fa*2<tot){
        int sn=fa*2;
        if (sn<tot && sure[heap[sn+1]]>sure[heap[sn]]) sn++;
        if (sure[heap[fa]]<sure[heap[sn]]){
                swap(heap[fa],heap[sn]);
                rank[heap[fa]]=fa;
                fa=sn;
        }
        else break;
    }
    rank[heap[fa]]=fa;
}
void Add_Heap(int k){
    sure[k]++;
    int sn=rank[k];
    while (sn>1){
        int fa=sn/2;
        if (sure[heap[fa]]<sure[heap[sn]]){
                swap(heap[fa],heap[sn]);
                rank[heap[sn]]=sn;
                sn=fa;
        }
        else break;
    }
    rank[heap[sn]]=sn;
}
void insert(int x,int y){
    mem[++cnt].data=y;
    mem[cnt].next=head[x];
    head[x]=cnt;
}
void paint(int l,int r,double frst,double step){
    for (int i=l;i<=r;i++,frst+=step){
        int t=line[i];
        vis[t]=true;
        value[t]=frst;
        for (int j=head[t];j;j=mem[j].next) Add_Heap(mem[j].data);
    }
}
bool check(){
    memset(sure,0,sizeof(sure));
    memset(vis,0,sizeof(vis));
    tot=0;
    for (int i=1;i<=l;i++) Put_Heap(i);
    int now;
    while (tot){
        Get_Heap(now);
        if (sure[now]){
           int last=0,first;
           double step;
           bool f1=false,f2=false;
           for (int i=Lnkhead[now];i<Lnkhead[now+1];i++)
               if (vis[line[i]]){
                  if (!last) first=last=i;
                  else {
                      step=(value[line[i]]-value[line[last]])/(i-last);
                      if (step==0) return false;
                      if (step<0) f1=true; else f2=true;
                      paint(last+1,i-1,value[line[last]]+step,step);
                      last=i;
                  }
               }
           if (f1 && f2) return false;
           if (sure[now]==1) step=n;
           paint(Lnkhead[now],first-1,value[line[first]]-step*first,step);
           paint(last+1,Lnkhead[now+1]-1,value[line[last]]+step,step);
        }
        else paint(Lnkhead[now],Lnkhead[now+1]-1,n,n);
    }
    return 1;
}
void print(){
    printf("YES\n");
    for (int i=1;i<=n;i++) dic[i].data=value[i],dic[i].lnk=i;
    sort(dic+1,dic+n+1,cmp());
    for (int i=1;i<=n;i++) ans[dic[i].lnk]=i;
    for (int i=1;i<n;i++) printf("%d ",ans[i]);
    printf("%d\n",ans[n]);
}
int main(){
    freopen("rail.in","r",stdin);
    freopen("rail.out","w",stdout);
    scanf("%d%d\n",&n,&m);
    for (int i=1,x,y;i<=m;i++) scanf("%d%d\n",&x,&y);
    scanf("%d\n",&l);
    memset(head,0,sizeof(head));
    cnt=0,len=0;
    for (int i=1,x;i<=l;i++){
        Lnkhead[i]=len+1;
        while (true){
                scanf("%d",&x);
                if (x==0) break;
                line[++len]=x;
                insert(x,i);
        }
    }
    Lnkhead[l+1]=len+1;
    if (check()) print();
    else printf("NO\n");
    return 0;
}

