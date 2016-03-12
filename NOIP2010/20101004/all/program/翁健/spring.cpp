

    #include<cstdio>
    #include<iostream>
    
    using namespace std;
   
    int gra[20][20];
    bool hash[20];
    int n,ans=2147483647;
    
    void dfs(int k,int time){
        if(k>n/2){
            ans=min(ans,time);
            return;
        }
        for(int i=1;i<=n;++i)
            for(int j=1;j<=n;++j){
                if(i!=j && !hash[i] && !hash[j]){
                    hash[i]=1;
                    hash[j]=1;
                    dfs(k+1,time+gra[i][j]);
                    hash[i]=0;
                    hash[j]=0;
                }
            }
    }
    
    int main(void){
        freopen("spring.in","r",stdin);
        freopen("spring.out","w",stdout);
        
        scanf("%d",&n);
        for(int i=1;i<=n;++i)
            for(int j=1;j<=n;++j)
                scanf("%d",&gra[i][j]);
        
        dfs(1,0);
        
        printf("%d\n",ans);
        
        return 0;
    }
