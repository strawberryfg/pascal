#include <iostream>
#include <stdio.h>
#define MAX 100001
#define INF 9999991
using namespace std;

struct node{
       long data;
       node *next;
       }*g[INF],*p,*p1,*p2;

long n,m;

long cal(string s){
     long i,k;
     k=0;
     for (i=s.size();s[i];i--)
         k=(k*26+(s[i]-'a'))%INF;
     return k;
     }

main(){
       freopen("engzam.in","r",stdin);
       freopen("engzam.out","w",stdout);
       cin>>n>>m;
       long i,j,k;
       string s,ss;
       for (i=1;i<=n;i++){
           cin>>s;
           ss="";
           for (j=0;s[j];j++){
               ss=ss+s[j];
               k=cal(ss);
               p=new struct node;
               scanf("%d",&p->data);
               if (g[k]==NULL||g[k]->data<p->data){
                  p->next=g[k];
                  g[k]=p;
                  } else{
                  p1=g[k];
                  p2=p1->next;
                  while (p2!=NULL&&p2->data>p->data){
                        p1=p2;
                        p2=p2->next;
                        }
                  p1->next=p;
                  p->next=p2;
                  }
               }
           }
       for (i=1;i<=m;i++){
           cin>>s;
           scanf("%d",&k);
           j=-1;
           p=g[cal(s)];
           while (p!=NULL&&p->data>=k){
                 p=p->next;
                 j++;
                 }
           printf("%d\n",j);
           }
       }
