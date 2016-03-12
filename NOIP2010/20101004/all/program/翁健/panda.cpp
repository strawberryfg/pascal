

    #include<cstdio>
    #include<iostream>
    #include<algorithm>
    
    using namespace std;
    
    int a[200],num[200000];
    int ans[200000];
    int n,k;
    
    bool cmp(int a,int b){
        return a>b;
    }
    
    int main(){
        freopen("panda.in","r",stdin);
        freopen("panda.out","w",stdout);
        
        scanf("%d%d",&n,&k);
        for(int i=0;i<n;++i)
            scanf("%d",&a[i]);
        
        int l=0,r;
        for(r=0;r<n;++r){
            ans[r]=a[r];
            num[r]=r;
        }
        
        long long t;
        int flag=1;
        
        while(flag){
            for(int i=num[l];i<n;++i){
                t=ans[l]*a[i];
                if(t<2000000000){
                    ans[r]=t;
                    num[r]=num[i];
                    r++;
                }
                else
                    flag=0;
            }
            l++;
        }
        
        sort(ans,ans+r);
        printf("%d\n",ans[k-1]);
        
        return 0;
    }
