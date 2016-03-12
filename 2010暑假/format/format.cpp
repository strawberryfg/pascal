#include <iostream>
#include <string>
#include <cstring>
using namespace std;

int width,tot,a[80][80],f[10000],len[10000];

void pre()
{
    int i,j,k;
    memset(a,-1,sizeof(a));
    for (i=1;i<=width;i++) { a[i][0]=0;a[i][1]=(i-1)*(i-1); }
    a[1][1]=0;
    for (i=2;i<=width;i++)
    {
        for (j=2;j<=i;j++)
        {
            for (k=1;k<=i-1;k++)
            {
                if (j-1>k) continue;
                if (a[i][j]==-1)
                   a[i][j]=a[k][j-1]+(i-k-1)*(i-k-1);
                else 
                   a[i][j]=min(a[i][j], a[k][j-1]+(i-k-1)*(i-k-1));
            }    
        }        
    }        
}    
void com(int now,int res)
{
    if (f[now]==-1 || res<f[now])
       f[now]=res;
}     

int another(int space,int num)
{
    return a[space][num];
}    
int work()
{
    int i,j,sum;
    for (i=0;i<=tot;i++) f[i]=-1;
    f[0]=0;
    for (i=0;i<=tot-1;i++)
    {
        if (len[i+1]==width) com(i+1,f[i]);
           else 
           {
               com(i+1,f[i]+500);
               sum=len[i+1];
               j=i+1; 
               while (sum+len[j+1]+j-i-1<=width && j+1<=tot)
               {
                   j++;
                   sum+=len[j];
                   if (width-sum<j-i-1) break;
                   com(j,f[i]+another(width-sum,j-i-1));
               }    
           }        
    }            
    return f[tot];
}    

int main()
{
    freopen("format.in","r",stdin);
    freopen("format.out","w",stdout);
    int i,j;
    char c;
    string str;
    scanf("%d",&width);

    str="";
    c=getchar();
    bool pd=false;
    while (c!=EOF)
    {
      if (c!='\n')   
      {
          str+=c;
      }    
      else if (pd==true) str+=' ';
      c=getchar();
      pd=true;
    }     
    str.erase(str.size()-1,1);
    tot=0;     
    pd=false;
    while (str.size()!=0)
    {
    pd=false;
    for (i=0;i<=str.size()-1;i++)
      {
         if (str[i]==' ')
         {
            j=i;
            while (j+1<=str.size()-1 && str[j+1]==' ') 
            {
                j++;
            }    
            pd=true;
            tot++;
            len[tot]=i;
            str.erase(0,j+1);
            break;
         }    
      }        
    if (pd==false) break;
   }    
   tot++;
   len[tot]=str.size();
   pre();
   printf("%s%d%s","Minimal badness is ",work(),".");
   printf("\n");  
    return 0;
}    
