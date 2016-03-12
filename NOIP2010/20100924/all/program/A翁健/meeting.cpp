#include<fstream>
#include<iostream>
#include<cstdlib>
#include<istream>
#include<ostream>
#include<map>
#include<string>
#include<cstring>
#include<cmath>
#include<algorithm>
#include<set>
#include<vector>
#include<stack>
#include<queue>
using namespace std;
ifstream fin("meeting.in");
ofstream fout("meetint.out");
long long seat[100000],peo[100000],ans=999999999,n;
long long m(long long a,long long b){
    if(a>b)
        return b;
    else
        return a;
}
long long getans(int x){
    long long t=0;
    for(int i=0;i<n;++i)
        t+=abs(x-seat[i])*peo[i];
    return t;
}
int main(){
    fin>>n;
    for(int i=0;i<n;++i)
        fin>>seat[i];
    for(int i=0;i<n;++i)
        fin>>peo[i];
    for(int i=0;i<n;++i)
        ans=m(getans(seat[i]),ans);
    fout<<ans;
    return 0;
}
