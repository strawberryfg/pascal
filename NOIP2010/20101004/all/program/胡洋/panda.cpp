#include<cstdio>
#include<cstring>
#include<cstdlib>

const int nn=100020;
inline void swap(int &a,int &b){int t=a;a=b;b=t;}
inline int min(int a,int b){return a<b?a:b;}

int comp(const void *a,const void *b){
    return *(int*)a-*(int*)b;
}

int n,a[200],K;
int f[nn];

int main(){
    freopen("panda.in","r",stdin);
    freopen("panda.out","w",stdout);
    int i,j,k,l,r,m;
    scanf("%d%d",&n,&K);
    for(i=1;i<=n;i++) scanf("%d",&a[i]);
    qsort(a+1,n,4,comp);
    //for(i=1;i<=n;i++) printf("%d ",a[i]);printf("\n");
    f[0]=1,f[1]=a[1];
    for(i=2;i<=K;i++){
        f[i]=2000000000;
        //
        l=0,r=i-1;
        while(l<r){
            m=(l+r)>>1;
            if(a[n]*f[m]>f[i-1]) r=m;
            else l=m+1;
        }
        j=l;
        //for(j=0;j<i;j++) if(a[n]*f[j]>f[i-1]) break;
        //
        for(;j<i;j++){
            //
            l=1,r=n;
            while(l<r){
                m=(l+r)>>1;
                if(a[m]*f[j]>f[i-1]) r=m;
                else l=m+1;
            }
            //for(k=1;k<=n;k++)if(a[k]*f[j]>f[i-1]) break;
            //
            k=l;
            f[i]=min(f[i],a[k]*f[j]);
            if(a[1]*f[j]>f[i-1]) break;
        }
            
    }
    printf("%d\n",f[K]);
    return 0;
}

