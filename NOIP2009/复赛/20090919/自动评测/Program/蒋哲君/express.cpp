#include <iostream>
#include <fstream>
#include <queue>
using namespace std;

ifstream in ("express.in");
ofstream out("express.out");

struct yk {
    int p;
    yk (int x) {p=x;}
};

int T,n,k;
priority_queue <yk> v;
int d[1000],r[1003],hash[1003];

int operator < (const yk &a, const yk &b) {
    return d[a.p]>=d[b.p];
}

void In() {

    in >> T;

}

int unit( int a , int b) {

    int sum=0,Max=b%10,Min=b%10;
    while (a) {
        sum+=a%10;
        a/=10;
    }
    while (b) {
        Max>?=b%10;
        Min<?=b%10;
        b/=10;
    }
    
    return sum*Max+Min;

}

void work() {

    int top=0;

    while (T--) {

        top=0; int flag=0;
        while (!v.empty()) v.pop();
        fill (d,d+1000,2147483647);
        memset(hash,0,sizeof(hash));

        in >> n >> k;
        if (n==k) {
            out << 0 << endl;
            continue;
        } else if (unit(n,n)==k) {
            out << 1 << endl;
            continue;
        }
        
        v.push(yk(unit(n,n)));
        r[++top]=n;
        r[++top]=unit(n,n);
        d[r[top]]=1;
        
        while (!v.empty() && flag==0) {

            int p=(v.top()).p; v.pop();
            if (hash[p]==1) continue;
            hash[p]=1;
            r[++top]=p;
            for (int i=1;i<=top && flag==0;i++) {

                int s;
                if (r[i]==n) s=0; else s=d[r[i]];

                int x=unit(r[i],p);
                    if (d[x]>s+d[p]+1) {
                        d[x]=s+d[p]+1;
                        v.push(yk(x));
                        if (x==k) {
                            flag=x;
                            break;
                        }
                    }
                x=unit(p,r[i]);
                    if (d[x]>s+d[p]+1) {
                        d[x]=s+d[p]+1;
                        v.push(yk(x));
                        if (x==k) {
                            flag=x;
                            break;
                        }
                    }

            }

        }
        
        if (d[flag]==2147483647) out << -1 << endl;
        else out << d[flag] << endl;

    }
    
}

int main () {

    In();
    work();

}
