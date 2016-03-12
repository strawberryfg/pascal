#include<iostream>
using namespace std;

struct node{
       node *son[27];
       int maxtime,times;
};

node *root;

node *insert(node *a,string s,int p,int l)
{
  int i;
  string st;
  
  if (a==NULL) 
    {
      a=new node;
      for (i=0; i<='z'-'a'+1; i++) a->son[i]=NULL;
      a->times=0;
      a->maxtime=0;
    }
  
  if (p>a->maxtime) a->maxtime=p;
  
  if (l>1)
    {
      st="";
      for (i=1; i<l; i++) st+=s[i];
      a->son[st[0]-96]=insert(a->son[st[0]-96],st,p,l-1);
    }
  else a->times=p;
  
  return a;
}

int dfs(node *a,int p)
{
  int i,ans;
  
  if (a->maxtime<p) return 0;
  if (a->times>=p) ans=1; else ans=0;
  for (i=1; i<='z'-'a'+1; i++)
    if (a->son[i]!=NULL) ans+=dfs(a->son[i],p);
    
  return ans;
}

int find(node *a,string s,int p,int l)
{
  int i;
  string st;
  
  if (a==NULL) return 0;
  if (a->maxtime<p) return 0;
  if (l==1) return (dfs(a,p));
  else
    {
      st="";
      for (i=1; i<l; i++) st+=s[i];
      return find(a->son[st[0]-96],st,p,l-1);
    }
}

int main(){
    
  int n,m,i,p,l,ans;
  string s,st;
  char c;
  
  freopen("engzam.in","r",stdin);
  freopen("engzam.out","w",stdout);
  
  cin>>n>>m;
  
  root=new node;
  for (i=1; i<='z'-'a'+1; i++) root->son[i]=NULL;
  root->times=0;
  root->maxtime=2147483647;
  
  for (i=1; i<=n; i++)
    {
      s="";
      l=0;
      scanf("%c",&c);
      while (c=='\n') scanf("%c",&c);
      while (c!=' ')
        {
          s+=c;
          scanf("%c",&c);
          l++;
        }
      cin>>p;
      root->son[s[0]-96]=insert(root->son[s[0]-96],s,p,l);
    }
    
  for (i=1; i<=m; i++)
    {
      s="";
      l=0;
      ans=0;
      scanf("%c",&c);
      while (c=='\n') scanf("%c",&c);
      while (c!=' ') 
        {
          s+=c;
          scanf("%c",&c);
          l++;
        }
        
      cin>>p;
      
      ans=find(root->son[s[0]-96],s,p,l);
      
      printf("%d\n",ans);
    }
  
}
