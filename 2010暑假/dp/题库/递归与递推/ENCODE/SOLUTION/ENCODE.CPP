#include<fstream.h>
#include<string.h>

ifstream fin("encode.in");
ofstream fout("encode.out");

char word[7];

long c(long n,long r) {
   long i,cc;
   cc=1;
   for (i=1;i<=r;i++)
      cc=cc*(n+1-i)/i;
   return cc;
}

int main() {
   long i,j,len,ans;
   fin>>(word+1);
   word[0]='a'-1;
   len=strlen(word)-1;
   ans=1;
   for (i=1;i<len;i++)
      ans+=c(26,i);
   for (i=1;i<=len;i++)
      if (word[i]>word[i-1])
	 for (j=word[i-1]+1;j<word[i];j++)
	    ans+=c(26-j+word[0],len-i);
      else {
	 ans=0;
	 break;
      }
   fout<<ans<<endl;
   return 0;
}
