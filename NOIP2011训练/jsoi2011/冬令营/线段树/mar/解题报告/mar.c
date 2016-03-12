#include<fstream>
#include<string>
#include<list>

ifstream fin("mar.in");
ofstream fout("mar.out");

const int maxn=31000;
struct TSegment {
       int s,e;
};
typedef list<TSegment> TList;
TList del[maxn],add[maxn];
int bl[maxn*2],br[maxn*2],rc[maxn*2],lc[maxn*2],d[maxn*2],len[maxn*2];
int n,top;

void insert(int p,int l,int r) {
     if (bl[p]==l&&br[p]==r) {
        len[p]=r-l;
        d[p]++;
        return;
     }
     int x=(bl[p]+br[p])/2;
     if (l<x) {
        if (r<=x) insert(lc[p],l,r);
        else {
             insert(lc[p],l,x);
             insert(rc[p],x,r);
        }
     }
     else insert(rc[p],l,r);
     if (!d[p]) len[p]=len[lc[p]]+len[rc[p]];
     else len[p]=br[p]-bl[p];
}

void erase(int p, int l, int r) {
     if (bl[p]==l&&br[p]==r) {
        d[p]--;
        if (!d[p]) {
           if (r-l>1) len[p]=len[lc[p]]+len[rc[p]];
           else len[p]=0;
        }
        else len[p]=r-l;
        return;
     }
     int x=(bl[p]+br[p])/2;
     if (l<x) {
        if (r<=x) erase(lc[p],l,r);
        else {
             erase(lc[p],l,x);
             erase(rc[p],x,r);
        }
     }
     else erase(rc[p],l,r);
     if (!d[p]) len[p]=len[lc[p]]+len[rc[p]];
     else len[p]=br[p]-bl[p];
}

int build(int l,int r) {
     int res=top++;
     bl[res]=l;
     br[res]=r;
     if (r-l>1) {
        int x=(r+l)/2;
        lc[res]=build(l,x);
        rc[res]=build(x,r);
     }
     return res;
}
     
void init() {
     fin>>n;
     int x1,x2,y1,y2;
     for (int i=0;i<n;i++) {
         fin>>x1>>y1>>x2>>y2;
         TSegment s;
         s.s=y1;s.e=y2;
         add[x1].push_back(s);
         del[x2].push_back(s);
     }
     build(0,30000);
}

void solve() {
     int res=0;
     for (int i=0;i<=30002;i++) {
         res+=len[0];
         for (TList::iterator iter=del[i].begin();iter!=del[i].end();iter++)
             erase(0,iter->s,iter->e);
         for (TList::iterator iter=add[i].begin();iter!=add[i].end();iter++)
             insert(0,iter->s,iter->e);
     }
     fout<<res<<endl;
}

int main() {
    init();
    solve();
    return 0;
}
             

