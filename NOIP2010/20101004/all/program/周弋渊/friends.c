#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int number_1[10];
int number_2[10];

void work() {
     FILE *fin,*fout;
     char str[1000000];
     int i,j;
     int n;
     int k;
     int x1,y1;
     int x2,y2;
     char s;
     int flag=0;
     fin=fopen("friends.in","r");
     fout=fopen("friends.out","w");
     x1=-1;
     y1=-1;
     x2=-1;
     y2=-1;
     fscanf(fin,"%d",&n);
     for (i=0;i<n;i++) {
         for (j=0;j<10;j++) {
             number_1[j]=0;
             number_2[j]=0;
             }
         fscanf(fin,"%s",str);
         for (j=0;j<strlen(str);j++)
           switch (str[j]) {
                  case '0':number_1[0]=1;break;
                  case '1':number_1[1]=1;break;
                  case '2':number_1[2]=1;break;
                  case '3':number_1[3]=1;break;
                  case '4':number_1[4]=1;break;
                  case '5':number_1[5]=1;break;
                  case '6':number_1[6]=1;break;
                  case '7':number_1[7]=1;break;
                  case '8':number_1[8]=1;break;
                  case '9':number_1[9]=1;break;
                  }
         fscanf(fin,"%c",&s);
         while (s!='\0') {
               switch (s) {
                      case '0':number_2[0]=1;break;
                      case '1':number_2[1]=1;break;
                      case '2':number_2[2]=1;break;
                      case '3':number_2[3]=1;break;
                      case '4':number_2[4]=1;break;
                      case '5':number_2[5]=1;break;
                      case '6':number_2[6]=1;break;
                      case '7':number_2[7]=1;break;
                      case '8':number_2[8]=1;break;
                      case '9':number_2[9]=1;break;
                      }
         for (j=0;j<10;j++) {
             if ((number_1[j]==1)&&(number_2[j]==0))
               if(x1!=-1)
                 x1=j;
               else if (y1!=-1)
                 y1=j;
               else {
                    flag=3;
                    break;
                    }
             if ((number_1[j]==0)&&(number_2[j]==1))
               if(x2!=-1)
                 x2=j;
               else if (y2!=-1)
                 y2=j;
               else {
                    flag=3;
                    break;
                    }
             }
         if (flag==3) {
                      fprintf(fout,"nothing\n");
                      continue;
                      }
         if ((x1==-1)&&(y1==-1)&&(x2==-1)&&(y2==-1)) {
                                                     fprintf(fout,"friends\n");
                                                     continue;
                                                     }
         if ((y1==-1)&&(y2==-1)) {
                                 fprintf(fout,"almost friends\n");
                                 continue;
                                 }
         else if (y1==-1) {
              if (((x1-x2==1)||(x1-x2==-1))&&((number_1[y2-1])||(number_1[y2+1]))) {
                                                                                   fprintf(fout,"almost friends\n");
                                                                                   continue;
                                                                                   }
              else if (((x1-y2==1)||(x1-y2==-1))&&((number_1[x2-1])||(number_1[x2+1]))) {
                                                                                   fprintf(fout,"almost friends\n");
                                                                                   continue;
                                                                                   }
              }
         else if (y2==-1) {
              if (((x2-x1==1)||(x2-x1==-1))&&((number_1[y1-1])||(number_1[y1+1]))) {
                                                                                   fprintf(fout,"almost friends\n");
                                                                                   continue;
                                                                                   }
              else if (((x2-y1==1)||(x2-y1==-1))&&((number_1[x1-1])||(number_1[x1+1]))) {
                                                                                   fprintf(fout,"almost friends\n");
                                                                                   continue;
                                                                                   }
              }
         else {
              fprintf(fout,"nothing\n");
              continue;
              }
         }
     fclose(fin);
     fclose(fout);
}

int main(int argc, char *argv[])
{
    work();
    //system("PAUSE");
    return 0;
}
