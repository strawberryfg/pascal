#include<iostream>
#include<math.h>
#include<string>

using namespace std;

FILE *fin=fopen("engzam.in","r");
FILE *fout=fopen("engzam.out","w");

long m,n,i,j,hash[600003],t,v,s,mm;
char ch;
string st;

struct node{
  string word;
  long times;
}list[100003];

void qsort(long l,long r)
     {
          long i=l,j=r;
          string x=list[(l+r)/2].word;
          do{
              while (list[i].word<x) i++;
              while (x<list[j].word) j--;
              if (i<=j)
              {
                 swap(list[i],list[j]);
                 i++;j--;
              }
          }while (i<=j);
          if (l<j) qsort(l,j);
          if (i<r) qsort(i,r);
     }

int main(){
  fscanf(fin,"%ld %ld\n",&n,&m);
  for(i=1;i<=n;++i){
    fscanf(fin,"%c",&ch);
     while(ch!=' '){
     list[i].word+=ch;
     fscanf(fin,"%c",&ch);    
     }
    fscanf(fin,"%ld\n",&(list[i].times));
  }
  qsort(1,n);
  memset(hash,0,sizeof(hash));
  for(i=1;i<=n;++i){
    t=list[i].word[0]-'a'+1;
    if(list[i].word.length()<=1)
      t=t*27;
     else t=t*27+list[i].word[1]-'a'+1;
    if(list[i].word.length()<=2)
      t=t*27;
     else t=t*27+list[i].word[2]-'a'+1;
    if(list[i].word.length()<=3)
      t=t*27;
     else t=t*27+list[i].word[3]-'a'+1;
     if (hash[t]==0) hash[t]=i;
  }
  for(i=1;i<=m;++i){
    st="";
    fscanf(fin,"%c",&ch);
     while(ch!=' '){
     st+=ch;
     fscanf(fin,"%c",&ch);    
     }
    fscanf(fin,"%ld\n",&v);
    t=st[0]-'a'+1;
    if(st.length()<=1)
      t=t*27;
     else t=t*27+st[1]-'a'+1;
    if(st.length()<=2)
      t=t*27;
     else t=t*27+st[2]-'a'+1;
    if(st.length()<=3)
      t=t*27;
     else t=t*27+st[3]-'a'+1;
  s=0;
  if(hash[t]!=0){
   for(j=hash[t];j<=n;++j){                     
     if(list[j].word.find(st)==0){
       if(list[j].times>=v) s++;
     }
     else break;
   }
  }
  else{
   for(j=hash[t];j<=n;++j){                     
     if(list[j].word.find(st)==0){
       if(list[j].times>=v) s++;
     }
   }
  }
   fprintf(fout,"%ld\n",s);
  }
  return 0;
}
