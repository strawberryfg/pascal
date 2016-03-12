#include <stdio.h>
#include <stdlib.h>
#include <math.h>

__int64 num[100];
int a[100];
int n;

void quicksort(int *a,int left,int right) {
     int b[100];
     int c[100];
     int len1=0;
     int len2=0;
     int k=*(a+left);
     int i,j;
     if (left>=right)
       return;
     for (i=left+1;i<=right;i++)
       if (*(a+i)<k) {
                     b[len1]=*(a+i);
                     len1++;
                     }
       else {
            c[len2]=*(a+i);
            len2++;
            }
     for (i=left;i<left+len1;i++)
       *(a+i)=b[i-left];
     *(a+left+len1)=k;
     for (i=left+len1+1;i<=right;i++)
       *(a+i)=c[i-left-len1-1];
     quicksort(a,left,left+len1);
     quicksort(a,left+len1+1,right);
     }

int check(int k,int j) {
    int i;
    for (i=0;i<n;i++)
      if (i==j)
        break;
      else
        if (k%a[i]==0)
          return 0;
    return 1;
}

void work() {
     FILE *fin,*fout;
     int k;
     int i,j;
     int min;
     int time=0;
     float x;
     int b[100];
     float c[100];
     float d[100];
     float e[100];
     fin=fopen("panda.in","r");
     fout=fopen("panda.out","w");
     fscanf(fin,"%d%d",&n,&k);
     for (i=0;i<n;i++)
       fscanf(fin,"%d",&a[i]);
     quicksort(a,0,n-1);
     for (i=0;i<n;i++) {
         num[i]=a[i];
         b[i]=0;
         c[i]=1;
         d[i]=(float)a[i];
         e[i]=(float)b[i];
         }
     
     while (time<k) {
           //printf("mun[0]=%d\n",num[0]);
           min=num[0];
           j=0;
           for (i=1;i<n;i++)
             if ((num[i]<min)&&(check(num[i],i))) {
                                                  min=num[i];
                                                  j=i;
                                                  }
           //printf("min=%d\n",min);
           time++;
           if (time==k)
             break;
           else {
                if (b[j]<n) {
                            num[j]=(int)(pow(d[j],c[j])*a[b[j]]);
                            b[j]++;
                            }
                else {
                     c[j]+=1;
                     b[j]=0;
                     num[j]=(int)(pow(d[j],c[j])*a[b[j]]);
                     }
                //printf("min=%d\n",min);
                /*printf("num[j]=%d\n min=%d\n",num[j],min);
                if (check(num[j],i))
                  continue;
                else
                  while (!check(num[j],j))
                    if (b[j]<n) {
                                num[j]=(int)(pow(d[j],c[j])*a[b[j]]);
                                b[j]++;//system("PAUSE");
                                }
                    else {
                         c[j]+=1;
                         b[j]=0;
                         num[j]=(int)(pow(d[j],c[j])*a[b[j]]);
                         }*/
                }
           }
     fprintf(fout,"%d\n",min);
}

int main(int argc, char *argv[])
{
    work();
    return 0;
}
