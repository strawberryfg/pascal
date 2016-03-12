#include <iostream.h>
#include <string.h>
int maxline=200,kz;
int reverse(char s[])
 {int i,j,t;
  for(i=0,j=strlen(s)-1; i<j; i++,j--)
   {t=s[i]; s[i]=s[j]; s[j]=t;}
  return 0;
 }
void main()
{ char line[100];
  cout<<"continue? -1 for end."<<endl; 
  cin>>kz;
  while(kz!=-1)
    { cin>>line;
      reverse(line); 
      cout<<line<<endl;
      cout<<"continue? -1 for end."<<endl; 
      cin>>kz;
     }
}

