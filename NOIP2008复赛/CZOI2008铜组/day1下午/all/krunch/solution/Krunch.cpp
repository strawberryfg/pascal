#include<stdio.h>
#include<stdlib.h>
#include<string>
#include<assert.h>
  using namespace std;

FILE *inp,*outp;
string s;
char ch;
int i,j,let[100];
main(){
    inp=fopen("Krunch.in","r");assert(inp);
	outp=fopen("Krunch.out","w");assert(outp);
	s="";
	while (!feof(inp)){
	  ch='!';fscanf(inp,"%c",&ch);
	  if (ch==' '||ch==','||ch=='.'||ch=='?'||(65<=int(ch)&&int(ch)<=90)) s+=ch;
	}
	s=' '+s+' ';
	memset(let,0,sizeof(let));
	for (i=1;i<s.size();i++){
		if (s[i]=='A'||s[i]=='E'||s[i]=='I'||s[i]=='O'||s[i]=='U'||(s[i-1]==' '&&s[i]==' ')){
		  s=s.substr(0,i)+s.substr(i+1,s.size()-i);i--;
      }else
	  if ((s[i]=='.'||s[i]==','||s[i]=='?')&&s[i-1]==' '){
		  s=s.substr(0,i-1)+s.substr(i,s.size()-i+1);i-=2;
	  }else
	  if (65<=int(s[i])&&int(s[i])<=90){
		  if (let[int(s[i])]==1){
		      s=s.substr(0,i)+s.substr(i+1,s.size()-1-i);i--;
		  }else
          let[int(s[i])]=1;
	  };
	}
	for (i=1;i<s.size()-1;i++)
	  fprintf(outp,"%c",s[i]);
	fprintf(outp,"\n");
	fclose(outp);
}