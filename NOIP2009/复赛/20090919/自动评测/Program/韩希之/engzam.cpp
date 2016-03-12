#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

using namespace std;

struct point
{
       point *next[26];
       vector<int> m;
}*root;

string s;

void init(point *&root)
{
     root=new point;
     for (int i=0;i<26;i++)
         root->next[i]=NULL;
}

void tree_insert(point *&root,int dep,int num)
{
     if (root==NULL) init(root);
     root->m.push_back(num);
     sort(root->m.begin(),root->m.end());
     if (dep==s.length()) return ;
     tree_insert(root->next[s[dep]-'a'],dep+1,num);
}

int tree_search(point *root,int dep,int num)
{
    if (root==NULL) return 0;
    if (dep==s.length()) return int(root->m.end()-lower_bound(root->m.begin(),root->m.end(),num));
    return tree_search(root->next[s[dep]-'a'],dep+1,num);
}

int n,m;

int main(){
    freopen("engzam.in","r",stdin);
    freopen("engzam.out","w",stdout);
    cin>>n>>m;
    for (int i=1;i<=n;i++)
    {
        char ch;
        s="";
        int num;
        scanf("\n%c",&ch);
        while (ch!=' ') {s+=ch;scanf("%c",&ch);}
        scanf("%d",&num);
        tree_insert(root,0,num);
    }
    for (int i=1;i<=m;i++)
    {
        char ch;
        s="";
        int num;
        scanf("\n%c",&ch);
        while (ch!=' ') {s+=ch;scanf("%c",&ch);}
        scanf("%d",&num);
        cout<<tree_search(root,0,num)<<"\n";
    }
    //system("pause");
    return 0;
}
