#include <iostream.h>
#include <string.h>

int main() {
	int n, maxs, award;
	char ans[21], str[21];
	int s1, s2, p, i;
	char w1, w2;

	cin>>n;  maxs=0;
	int total = 0;
	for (i=0; i<n; i++) {
		cin>>str>>s1>>s2>>w1>>w2>>p;
		award=0;
		if (s1>80&&p>0) award+=8000;
		if (s1>85&&s2>80) award+=4000;
		if (s1>90) award+=2000;
		if (s1>85&&w2=='Y') award+=1000;
		if (s2>80&&w1=='Y') award+=850;
		if (maxs<award) {
			maxs=award;
			strcpy(ans, str);
		}
		total += award;
	}
	cout<<ans<<endl<<maxs<<endl<<total << endl;
	return 0;
}