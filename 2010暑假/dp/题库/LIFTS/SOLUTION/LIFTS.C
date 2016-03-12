#include <stdio.h>
#define MAX 201
#define maxt 1e+30

int nlift,nfloor,i,j,k;
int	low[MAX],high[MAX];
double opt[10001];
int on[10001];
int ref;
int ok,a,b;
typedef long double real;
real wait;

int main()
{
	FILE* inf=fopen("lifts.in","r");
	FILE* outf=fopen("lifts.out","w");

	fscanf(inf,"%d %d\n",&nlift,&nfloor);

	for (i=1; i<=nlift; i++)
		fscanf(inf,"%d %d\n",&low[i],&high[i]);
	fclose(inf);

	for (i=1; i<=nfloor; i++)
		opt[i]=maxt;

	opt[nfloor]=0;
	on[nfloor]=1;

	do {
		ref=0;
		for (i=1; i<=nfloor; i++)
			if (on[i]) {
				on[i]=0;
				for (j=1; j<=nlift; j++)
					if (low[j]<=i && i<=high[j]) {
						a=high[j]-i; b=i-low[j];
						wait=(real)(a*(a+1)+b*(b+1))/(real)(2*(a+b+1));
						for (k=low[j]; k<=high[j]; k++)
							if (opt[i]+wait+abs(i-k)<opt[k]) {
								opt[k]=opt[i]+wait+abs(i-k);
								on[k]=1;
								ref=1;
							}
					}
			}
	} while (ref==1);

	fprintf(outf,"%.5f",opt[1]);
	fclose(outf);

	return 0;
}

