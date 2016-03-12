#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
struct typ
{
       int pos,c;
}call[100000];
int tot;
void work(int be,int en,int dec)
{
     int tmp,fmin,minnum,i;
     if (be>en)return;
     if (be==en)
     {
         call[be].c=call[be].c-dec;
         tot+=call[be].c;
         return; 
     }
     else
     {
         if (dec!=0)
         {
            for (i=be;i<=en;i++) call[i].c=call[i].c-dec;
         }
         fmin=2147483647; minnum=0;
         for (i=be;i<=en;i++) if (call[i].c<fmin) { minnum=i;fmin=call[i].c; }
         tmp=call[minnum].c;
         tot+=tmp;
         call[minnum].c=0;
         work(be,minnum-1,tmp);
         work(minnum+1,en,tmp);
     }
}
bool cmp(typ a,typ b)
{
     return a.pos<b.pos;
 }
int main()
{
    freopen("call.in","r",stdin);
    freopen("call.out","w",stdout);
    int n,m,i,x,y;
    scanf("%d %d",&n,&m);
    tot=0;
    for (i=1;i<=m;i++)
    {
        scanf("%d %d",&x,&y);
        call[i].pos=x;
        call[i].c=y;
    }
    sort(call+1,call+m+1,cmp);
    work(1,m,0);
    printf("%d\n",tot);
    return 0;
}
