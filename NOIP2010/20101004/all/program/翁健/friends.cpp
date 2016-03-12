

    #include<cstdio>
    #include<cstring>
    #include<iostream>
    
    using namespace std;

    int n;
    char str[500];
    int a[200],b[200];
    int num1[10],num2[10];
    
    void get_info(){
        gets(str);
        
        int p=0;
        while(str[p]>='0' && str[p]<='9'){
            a[p+1]=str[p]-'0';
            ++num1[a[p+1]];
            ++p;
        }
        
        int q=p+1;
        while(str[q]>='0' && str[q]<='9'){
            b[q-p]=str[q]-'0';
            ++num2[b[q-p]];
            ++q;
        }
        
        a[0]=p;
        b[0]=q-p-1;
        return;
    }
    
    bool check(int a,int b){
        if(a==0 && b==0)
            return 1;
        if(a!=0 && b!=0)
            return 1;
        return 0;
    }
    
    bool situ(int a,int b,int st,int p,char wh){
        if(a<0 || b<0)
            return 0;
        if(a==10 || b==10)
            return 0;
        if(a==0 && p==1)
            return 0;

        int aa,bb;
        if(st==1){
            aa=a-1;
            bb=b+1;
        }
        if(st==2){
            aa=a+1;
            bb=b-1;
        }
        
        if(wh=='a'){
            num1[aa]--;
            num1[bb]--;
            num1[a]++;
            num1[b]++;
        }
        if(wh=='b'){
            num2[aa]--;
            num2[bb]--;
            num2[a]++;
            num2[b]++;
        }
        
        for(int i=0;i<9;++i)
            if(! check(num1[i],num2[i])){
                if(wh=='a'){
                    num1[aa]++;
                    num1[bb]++;
                    num1[a]--;
                    num1[b]--;
                    return 0;
                }
                if(wh=='b'){
                    num2[aa]++;
                    num2[bb]++;
                    num2[a]--;
                    num2[b]--;
                    return 0;
                }

            }

        if(wh=='a'){
            num1[aa]++;
            num1[bb]++;
            num1[a]--;
            num1[b]--;
        }
        if(wh=='b'){
            num2[aa]++;
            num2[bb]++;
            num2[a]--;
            num2[b]--;
        }

        return 1;

    }
    
    char *ans(int *a,int *b){
        bool flag=1;
        for(int i=0;i<10;++i)
            if(! check(num1[i],num2[i])){
                flag=0;
                break;
            }
        if(flag)
            return"friends";
        
        flag=0;
        
        for(int i=1;i<=a[0];++i){
            if(i==a[0])
                continue;
            if(situ(a[i]+1,a[i+1]-1,1,i,'a'))
                return "almost friends";
            if(situ(a[i]-1,a[i+1]+1,2,i,'a'))
                return "almost friends";
        }

        for(int i=1;i<=b[0];++i){
            if(i==b[0])
                continue;
            if(situ(b[i]+1,b[i+1]-1,1,i,'b'))
                return "almost friends";
            if(situ(b[i]-1,b[i+1]+1,2,i,'b'))
                return "almost friends";
        }

        return"nothing";
    }
    
    void cln_info(){
        memset(a,0,sizeof(a));
        memset(b,0,sizeof(b));
        memset(num1,0,sizeof(num1));
        memset(num2,0,sizeof(num2));
        return;
    }
    
    int main(void){
        freopen("friends.in","r",stdin);
        freopen("friends.out","w",stdout);
        
        scanf("%d\n",&n);
        for(int i=0;i<n;++i){
            get_info();
            printf("%s\n",ans(a,b));
            cln_info();
        }
        
        return 0;
    }
