#include<iostream>
using namespace std;
int N;
int main(void){
    freopen("seq.in","r",stdin);
    freopen("seq.out","w",stdout);
    scanf("%d\n",&N);
    int a,b;
    scanf("%d\n",&a);
    scanf("%d\n",&b);
    if (a>b){ printf("0\n");return 0;}
    int ans=1+b-a;
    for (int i=2;i<N;i++){
        a=b;
        scanf("%d\n",&b);
        if (a>b){ printf("0\n");return 0;}    
    }
    printf("%d\n",ans);
}
