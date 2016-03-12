#include<iostream.h>
#include<stdlib.h>
#include<stdio.h>
#include<string>
#include<assert.h>
  using namespace std;

FILE *inp,*outp;
string s,ans;
string g[101][101];
char ch;
int i,j;
  char Queen(char s1){
    if (s1=='(') return ')';else
    if (s1=='[') return ']';else
    if (s1==')') return '(';else
                 return '[';
  }
  string King(int p1,int p2){
    if (p1>p2) return "";
    if (g[p1][p2]!="#") return g[p1][p2];
    string s1;
    if (s[p1]=='('||s[p1]=='['){
        g[p1][p2]=s[p1];
        g[p1][p2]+=Queen(s[p1])+King(p1+1,p2);
        for (int i=p1+1;i<=p2;i++)
          if (s[i]==Queen(s[p1])){
              s1=s[p1]+King(p1+1,i-1)+s[i]+King(i+1,p2);
              if (s1.size()<g[p1][p2].size()) g[p1][p2]=s1;
          }
    }else{
        g[p1][p2]=Queen(s[p1]);
        g[p1][p2]+=s[p1]+King(p1+1,p2);
    }
    return g[p1][p2];
  }
main(){
    inp=fopen("bracket.in","r");assert(inp);
    outp=fopen("bracket.out","w");assert(outp);
    s="";
    while (!feof(inp)){
      fscanf(inp,"%c",&ch);
      if (ch=='('||ch==')'||ch=='['||ch==']') s+=ch;
    }
    for (i=0;i<s.size();i++)
    for (j=i;j<s.size();j++) g[i][j]="#";
    ans=King(0,s.size()-1);
    for (i=0;i<ans.size();i++)
      fprintf(outp,"%c",ans[i]);
    fprintf(outp,"\n");
    fclose(outp);
}
