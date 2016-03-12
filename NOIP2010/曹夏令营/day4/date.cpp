#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
#include <string>
using namespace std;
const int spe[13]={0,31,28,31,30,31,30,31,31,30,31,30,31};
bool run,mark;
int main()
{
    freopen("date.in","r",stdin);
    freopen("date.out","w",stdout);
    int i,j,t,tt,tmp,ans,num,st,find,month[3],day[3],year,tot;
    char c;
    string s;

    scanf("%d",&t);
    c=getchar();
    for (j=1;j<=t;j++)
    {   
         s="";
        c=getchar(); tot=-1;
        while (c!=EOF && c!='\n')
        {
              s=s+c;
              c=getchar();
              tot++;
        }
        find=0; num=0;
        for (i=0;i<=tot;i++) 
           if (s[i]=='/') { find=i;break; }
           else num=10*num+int(s[i])-48;
        month[1]=num;
        num=0; st=find; find=0;
        for (i=st+1;i<=tot;i++) 
           if (s[i]=='/') { find=i;break; }
           else num=10*num+int(s[i])-48;
        day[1]=num;
        num=0; st=find; find=0;
        for (i=st+1;i<=tot;i++)
            if (s[i]==' ') {find=i;break; }
               else num=10*num+int(s[i])-48;
        year=num;
        num=0; st=find; find=0;
        for (i=st+1;i<=tot;i++) 
           if (s[i]=='/') { find=i;break; }
           else num=10*num+int(s[i])-48;
        month[2]=num;
        num=0; st=find; 
        for (i=st+1;i<=tot;i++) num=10*num+int(s[i])-48;
        day[2]=num;
        run=false; mark=false;
        if (year%400==0 || (year%100!=0 && year%4==0)) run=true;
        if (month[1]>month[2] || (month[1]==month[2] && day[1]>day[2]))
        { swap(month[1],month[2]); swap(day[1],day[2]); mark=true;}
        tt=day[1]+7;
        if (month[1]==month[2] && day[1]==day[2])
          printf("SAME DAY\n");
        else if (month[1]==month[2])
        {
           tt=day[2]-day[1];  
           if (tt<=7)
           {   
                  
           if (mark) 
           { 
                 if (tt>1)    printf("%d/%d/%d IS %d DAYS PRIOR",month[1],day[1],year,tt);
                 else printf("%d/%d/%d IS %d DAY PRIOR",month[1],day[1],year,tt);
           }
              else 
              {
                   if (tt>1)printf("%d/%d/%d IS %d DAYS AFTER",month[2],day[2],year,tt);
                   else printf("%d/%d/%d IS %d DAY PRIOR",month[1],day[1],year,tt);
              }
           printf("\n");
           }
           else printf("%s\n","OUT OF RANGE");
        }
        else 
        {
             ans=spe[month[1]];
             if (month[1]==2) if (run) ans=29; 
             if (month[2]-month[1]==1)
             {
             if (tt<=ans) 
             {
                           printf("%s\n","OUT OF RANGE");  
             }
             else {
                     tmp=day[1]+7-ans;
                     if (day[2]<=tmp) 
                     { 
                       tmp=ans+day[2]-day[1];
                       if (mark)
                       {
                          if (tt>1) printf("%d/%d/%d IS %d DAYS PRIOR",month[1],day[1],year,tmp);
                           else printf("%d/%d/%d IS %d DAY PRIOR",month[1],day[1],year,tmp);
                       }
                       else  
                       {
                          if (tt>1) printf("%d/%d/%d IS %d DAYS AFTER",month[2],day[2],year,tmp);              
                           else printf("%d/%d/%d IS %d DAY AFTER",month[2],day[2],year,tmp);
                       }
                       printf("\n");
                     }
                  }
             }
             else
             {
                 if (month[2]!=12 ||( month[2]==12 && month[1]!=1)) printf("OUT OF RANGE\n");
                 else {
                         tmp=day[1]+31-day[2];
                         if (tmp<=7)
                         {
                            if (mark) 
                            {
                               if(tt>1) printf("%d/%d/%d IS %d DAYS AFTER",month[1],day[1],year+1,tmp);
                                else printf("%d/%d/%d IS %d DAY AFTER",month[1],day[1],year+1,tmp);
                            }
                            else 
                            {
                               if(tt>1) printf("%d/%d/%d IS %d DAYS PRIOR",month[2],day[2],year-1,tmp); 
                                else printf("%d/%d/%d IS %d DAY PRIOR",month[2],day[2],year-1,tmp);
                            }
                            printf("\n");
                         }
                      }
             }
        }
    }
    return 0;
}
