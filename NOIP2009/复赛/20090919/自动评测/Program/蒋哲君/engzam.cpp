#include <iostream>
#include <fstream>
using namespace std;

ifstream in ("engzam.in");
ofstream out("engzam.out");

struct node{
    node *r[26];
    int ok,sot,top;
    int v[100003];
    
    node () {
        for (int i=0;i<26;i++) r[i]=NULL;
        ok=0;sot=0;top=0;
    }
}*h;

void insert(node *h,string &s, int p, int k) {

    if (p==s.length()) {
        h->ok=1;
        h->v[++h->top]=k;
        return;
    }
    
    int e=s[p]-97;
    if (h->r[e]==NULL) h->r[e]=new node;
    
    insert(h->r[e],s,p+1,k);
    h->v[++h->top]=k;
    
}

int find(node *h, string &s, int p, int k) {

    if (s.length()==p) {

        if (h->sot==0) {
            h->sot=1;
            sort(h->v+1,h->v+h->top+1);
        }
        
        int *f=lower_bound(h->v+1,h->v+h->top+1,k);
        return h->v+h->top+1-f;

    }
    
    if (h->r[s[p]-97]==NULL) return 0;
    else return find(h->r[s[p]-97],s,p+1,k);

}

int n,m;

void In() {

    in >> n >> m;
    
    h=new node;
    
    for (int i=1;i<=n;i++) {

        string s; int k;
        in >> s >> k;
        
        insert(h,s,0,k);
        
    }

}

void work() {

    while (m--) {

        string s; int p;
        
        in >> s >> p;
        
        out << find(h,s,0,p) << endl;
    }

}

int main () {

    In();
    work();

}
