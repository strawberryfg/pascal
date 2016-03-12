#include<iostream>
using namespace std;
int hash[2][11],num[2][200];
bool pd(){
     for (int j=0;j<10;j++) if (hash[0][j] && !hash[1][j] || !hash[0][j] && hash[1][j])
         return false;
     return true;
}
int main(){
    int n,i,j,tot,tott[2];
    char a;
    bool pp;
    freopen("friends.in","r",stdin);
    freopen("friends.out","w",stdout);
    cin>>n; getchar();
    for (i=0;i<n;i++){
        a=getchar();
        memset(num,0,sizeof num); memset(hash,0,sizeof hash);
        memset(tott,0,sizeof tott); tot=0;
        while (a!='\n'){
              if (a==' ') {tot++; a=getchar(); continue;}
              num[tot][tott[tot]++]=a-'0';
              hash[tot][a-'0']++;
              a=getchar();
        }
        pp=false;
        if (pd()) {cout<<"friends\n"; continue;}
        for (j=1;j<tott[0]-1;j++){
            if (num[0][j]!=0 && num[0][j+1]!=9){
               hash[0][num[0][j]]--; hash[0][num[0][j]-1]++;
               hash[0][num[0][j+1]]--; hash[0][num[0][j+1]+1]++;
               if (pd()) pp=true;
               hash[0][num[0][j]]++; hash[0][num[0][j]-1]--;
               hash[0][num[0][j+1]]++; hash[0][num[0][j+1]+1]--;
            }
            
            if (num[0][j+1]!=0 && num[0][j]!=9){
               hash[0][num[0][j+1]]--; hash[0][num[0][j+1]-1]++;
               hash[0][num[0][j]]--; hash[0][num[0][j]+1]++;
               if (pd()) pp=true;
               hash[0][num[0][j+1]]++; hash[0][num[0][j+1]-1]--;
               hash[0][num[0][j]]++; hash[0][num[0][j]+1]--;
            }
        }
        j=0;
        if (num[0][j]>1 && num[0][j+1]!=9){
               hash[0][num[0][j]]--; hash[0][num[0][j]-1]++;
               hash[0][num[0][j+1]]--; hash[0][num[0][j+1]+1]++;
               if (pd()) pp=true;
               hash[0][num[0][j]]++; hash[0][num[0][j]-1]--;
               hash[0][num[0][j+1]]++; hash[0][num[0][j+1]+1]--;
            }
        if (num[0][j+1]!=0 && num[0][j]!=9){
               hash[0][num[0][j+1]]--; hash[0][num[0][j+1]-1]++;
               hash[0][num[0][j]]--; hash[0][num[0][j]+1]++;
               if (pd()) pp=true;
               hash[0][num[0][j+1]]++; hash[0][num[0][j+1]-1]--;
               hash[0][num[0][j]]++; hash[0][num[0][j]+1]--;
            }
        
        for (j=1;j<tott[1]-1;j++){
            if (num[1][j]!=0 && num[1][j+1]!=9){
               hash[1][num[1][j]]--; hash[1][num[1][j]-1]++;
               hash[1][num[1][j+1]]--; hash[1][num[1][j+1]+1]++;
               if (pd()) pp=true;
               hash[1][num[1][j]]++; hash[1][num[1][j]-1]--;
               hash[1][num[1][j+1]]++; hash[1][num[1][j+1]+1]--;
            }
            
            if (num[1][j+1]!=0 && num[1][j]!=9){
               hash[1][num[1][j+1]]--; hash[1][num[1][j+1]-1]++;
               hash[1][num[1][j]]--; hash[1][num[1][j]+1]++;
               if (pd()) pp=true;
               hash[1][num[1][j+1]]++; hash[1][num[1][j+1]-1]--;
               hash[1][num[1][j]]++; hash[1][num[1][j]+1]--;
            }
        }
        
        j=0;
        if (num[1][j]>1 && num[1][j+1]!=9){
               hash[1][num[1][j]]--; hash[1][num[1][j]-1]++;
               hash[1][num[1][j+1]]--; hash[1][num[1][j+1]+1]++;
               if (pd()) pp=true;
               hash[1][num[1][j]]++; hash[1][num[1][j]-1]--;
               hash[1][num[1][j+1]]++; hash[1][num[1][j+1]+1]--;
            }
        if (num[1][j+1]!=0 && num[1][j]!=9){
               hash[1][num[1][j+1]]--; hash[1][num[1][j+1]-1]++;
               hash[1][num[1][j]]--; hash[1][num[1][j]+1]++;
               if (pd()) pp=true;
               hash[1][num[1][j+1]]++; hash[1][num[1][j+1]-1]--;
               hash[1][num[1][j]]++; hash[1][num[1][j]+1]--;
            }
        if (pp) cout<<"almost friends\n"; else cout<<"nothing\n";
    }
    return 0;
}
