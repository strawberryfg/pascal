#include <iostream>

using namespace std;

int w[1000],v[1000];
double st[1000];
int main()
{
    freopen("convoy.in","r",stdin);
    freopen("convoy.out","w",stdout);
    int weight,len,n,i,j,noww,nowv;
    double t;
    scanf("%d %d %d",&weight,&len,&n);
    memset(w,0,sizeof(w));
    memset(v,0,sizeof(v));
    for (i=1;i<=n;i++)
    {
        scanf("%d %d",&w[i],&v[i]);
        st[i]=2147483647;
    }    
    st[0]=0;
    for (i=1;i<=n;i++)
    {
        noww=w[i]; nowv=v[i];
        for (j=i-1;j>=0;j--)
        {
            t=(float)len/(float)nowv;
            if (noww>weight)break;
            st[i]=min(st[i],st[j]+t);
            noww+=w[j];
            if (v[j]<nowv) nowv=v[j];
        }    
    }    
    printf("%0.1f",st[n]*60);
    //system("pause");
    return 0;
}    
