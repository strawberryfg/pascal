#include <cstdio>
#include <cstring>
#include <algorithm>
#include <cstdlib>
using namespace std;
int tot,ans,sum,b[100][100],a[100],fmin,tt;
bool final(int a[100])
{
     int black=0,white=0,i;
     for (i=1;i<=tot;i++)
     {
         if (a[i]==1) 
         { if (black==0) { black=1;white=0; }
           else  {if (white>=1) return false; else white=0; }
         }
         if (a[i]==2)white++;  
     }
     return true;
}
bool ok(int a[100])
{
     bool mark,pd;
     int i,j;
         mark=true;
          for (i=1;i<=sum;i++) 
              {
                 pd=true;
                 for (j=1;j<=tot;j++) if (b[i][j]!=a[j]) {pd=false;break;}
                 if (pd==true) { mark=false;break; }
              }
      return mark;
}
void work(int dep,int now,int from,int a[100])
{
     int t1,t2,i,temp[100];
     tt=dep;
     if (dep>10)return;
     if (dep>fmin)return;
     for (i=1;i<=tot;i++) temp[i]=a[i];
     if (final(a))
     {
         if (dep-1<fmin)fmin=dep-1;
     }
     if (from!=2 && now+1<=tot)
      {
          swap(a[now],a[now+1]);
          if (ok(a)) 
          {
            sum++;
            for (i=1;i<=tot;i++) b[sum][i]=a[i];
            work(dep+1,now+1,1,a);   
              sum--;    
          }
         for (i=1;i<=tot;i++) a[i]=temp[i];
         
      }
      if (from!=1 && now-1>=1)
      {
          swap(a[now],a[now-1]);
          if (ok(a)) 
          {
            sum++;
            for (i=1;i<=tot;i++) b[sum][i]=a[i];
            work(dep+1,now-1,2,a); 
              sum--;     
          }
          for (i=1;i<=tot;i++) a[i]=temp[i];
                            
      }
      if (from!=4 && now+2<=tot)
      {
          t1=a[now]; t2=a[now+2];
          a[now+2]=3-a[now+2];
          swap(a[now],a[now+2]);
          if (ok(a)) 
          {
            sum++;
            for (i=1;i<=tot;i++) b[sum][i]=a[i];
            work(dep+1,now+2,3,a);  
               sum--;     
          }
           for (i=1;i<=tot;i++) a[i]=temp[i];
                          
      }     
      if (from!=3 && now-2>=1)
      {
          t1=a[now]; t2=a[now-2];
          a[now-2]=3-a[now-2];
          swap(a[now],a[now-2]);
          if (ok(a)) 
          {
            sum++;
            for (i=1;i<=tot;i++) b[sum][i]=a[i];
            work(dep+1,now-2,4,a); 
                sum--;       
          }
          for (i=1;i<=tot;i++) a[i]=temp[i];
                        
      }            
}
int main()
{
    freopen("frog.in","r",stdin);
    freopen("frog.out","w",stdout);
    int tnow;
    char c;
    c=getchar();tot=0; ans=0;
    while (c!=EOF && c!='\n')
    {
          if (c=='B') a[++tot]=1;
          else if (c=='W') a[++tot]=2;
            else  { a[++tot]=3;tnow=tot; }
          c=getchar();
    }
    sum=0;
    fmin=2147483647;
    work(1,tnow,0,a);
    if (fmin==2147483647) printf("-1\n"); else
    printf("%d\n",fmin);
    return 0;
}
