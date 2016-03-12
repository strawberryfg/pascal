#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int n1,n2,n,i,j;

char strx[200],stry[200];
int check(char str1[],char str2[])
{
   int p,mark1[10]={0},mark2[10]={0};
   for(p=0;p<n1;p++)
     mark1[str1[p]-'0']=1;
   for(p=0;p<n2;p++)
     mark2[str2[p]-'0']=1;
   for(p=0;p<10;p++)
   {
     if(mark1[p]!=mark2[p])  return 0;
   }
   return 1;
}
int main(int argc, char *argv[])
{
  freopen("friends.in","r",stdin);
  freopen("friends.out","w",stdout);
  scanf("%d",&n);
  
 for(j=0;j<n;)
  {
  A:j++;
    if(j>n)  break;
    scanf("%s %s",strx,stry);
    n1=strlen(strx);
    n2=strlen(stry);
    if(check(strx,stry))  printf("friends\n");
    else 
    {
      
      for(i=0;i<n1-1;i++)
      {
        if( (strx[i+1]!='9') && (strx[i]!=0))
        {
   
         if((i==0) && (strx[i]!='1'))
         {
         strx[i]-=1;
         strx[i+1]+=1;
         if(check(strx,stry)) { printf("almost friends\n");strx[i]+=1;strx[i+1]-=1;goto A; }
         strx[i]+=1;
         strx[i+1]-=1;
         }
        }
      if((strx[i]!='9') && (strx[i+1]!=0))
        {
         strx[i]+=1;
         strx[i+1]-=1;
         if(check(strx,stry)) { printf("almost friends\n");strx[i]-=1;strx[i+1]+=1;goto A; }
         strx[i]-=1;
         strx[i+1]+=1;
        }
      }
      
      for(i=0;i<n2-1;i++)
      {
        if( (stry[i+1]!='9') && (stry[i]!=0))
        {
         if((i==0) && (stry[i]!='1'))
         {
         stry[i]-=1;
         stry[i+1]+=1;
         if(check(strx,stry)) { printf("almost friends\n");stry[i]+=1;stry[i+1]-=1;goto A; }
         stry[i]+=1;
         stry[i+1]-=1;
         }
        }
        if((stry[i]!='9') && (stry[i+1]!=0))
        {
         stry[i]+=1;
         stry[i+1]-=1;
         if(check(strx,stry)) { printf("almost friends\n");stry[i]-=1;stry[i+1]+=1;goto A; }
         stry[i]-=1;
         stry[i+1]+=1;
        }
      }
      printf("nothing\n");
    }
  }
  return 0;
}
