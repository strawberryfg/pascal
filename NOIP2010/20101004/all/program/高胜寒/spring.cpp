#include<iostream>
using namespace std;
int n,m,a[20][20],zh[1048576];
bool pd[20];
bool mobaiyangkuan(int pre){
     int num=0;
     for (int i=0;i<n;i++) if (pd[i]) num=num*2+1; else num=num*2;
     if (zh[num]<=pre) return true;
     zh[num]=pre; return false;
}
void springg(int now,int ti){
    if (mobaiyangkuan(ti)) return;
    if (now==n/2 || ti>=m) {m<?=ti; return;}
    for (int i=0;i<n;i++){
        if (pd[i]){
           pd[i]=false;
           for (int j=i+1;j<n;j++)
               if (pd[j]){
                  pd[j]=false;
                  springg(now+1,ti+a[i][j]);
                  pd[j]=true;
               }
           pd[i]=true;
           break;
        }
    }
    return;
}
int main(){
    freopen("spring.in","r",stdin);
    freopen("spring.out","w",stdout);
    cin>>n;
    m=2147483647;
    memset(pd,true,sizeof pd);
    memset(zh,62,sizeof zh);
    for (int i=0;i<n;i++){
        for (int j=0;j<n;j++) cin>>a[i][j];
    }
    springg(0,0);
    cout<<m<<endl;
    return 0;
}
