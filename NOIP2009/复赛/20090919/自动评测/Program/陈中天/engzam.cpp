#include<iostream>

using namespace std;


string s[10000],ask;
int k[10000];
int n,m,q,i,j,l;
char ch1,ch2,ch3,ch4,ch11,ch22,ch33,ch44;
int hash[30][30][30][30];

void qsort(int l,int r)
     {
          int i=l,j=r;string x=s[(l+r)/2],y;
          do{
              while (s[i]<x) i++;
              while (x<s[j]) j--;
              if (i<=j)
              {
                 swap(s[i],s[j]);
                 swap(k[i],k[j]);
                 i++;j--;
              }
          }while (i<=j);
          if (l<j) qsort(l,j);
          if (i<r) qsort(i,r);
     }


int main()
{
    freopen("engzam.in","r",stdin);
    freopen("engzam.out","w",stdout);
    
    cin>>n>>m;
    for (i=1;i<=n;i++)
        {
            cin>>s[i]>>k[i];
        }
    qsort(1,n);
   
        
    for (i=1;i<=m;i++)
        {
            cin>>ask>>q;
            bool find=false;
            int ans=0;
            
            for (j=1;j<=n;j++)
                {
                    
                    bool find1=true;
                    for (l=0;l<=ask.length()-1;l++)
                        {
                            if (ask[l]!=s[j][l]) {find1=false;break;}
                        }
                    if (find1&&q<=k[j]) {find=true;ans++;}
                }
            cout<<ans<<endl;
        }
    return 0;
}
