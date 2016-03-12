#include<fstream>
using namespace std;
ifstream fin("sugar.in");
ofstream fout("sugar.out");
int n;
long long a,ans;
int main(){
    fin>>n;
    a=n;
    ans=(a+1)*a/2+a+1;
    fout<<ans<<endl;
    return 0;
}
