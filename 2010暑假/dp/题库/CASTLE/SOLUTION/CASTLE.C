#include <stdio.h>

int n,i,j,k,si;
int size[101];
int	h[5051];
int curh1[5051], curh2[5051];
int ns;
int max;
int	maxv=0,curv;

int main()
{
	FILE* inf=fopen("castle.in","r");
	FILE* outf=fopen("castle.out","w");

	fscanf(inf,"%d\n",&n);
	for (i=1; i<=n; i++) {
		memset(curh1,0,sizeof(curh1));
		j=0; max=0;
		do {
			fscanf(inf,"%d",&si);
			if (si==-1) break;
			j++;
			size[j]=si;
			max+=si;
		} while (1);
		ns=j;

		if (maxv>0 && max>maxv)
			max=maxv;

		curh1[0]=1;
		for	(j=1; j<=ns; j++) {
			memcpy(curh2,curh1,sizeof(curh1));
			for (k=0; k<max; k++)
				if (curh1[k]==1 && k+size[j]<=max)
					curh2[k+size[j]]=1;
			memcpy(curh1,curh2,sizeof(curh1));
		}

		if (maxv==0) {
			maxv=max;
			memcpy(h,curh2,sizeof(curh2));
		}
		else {
			if (max<maxv)
				maxv=max;

			curv=0;
			for (j=maxv; j>=0; j--)
				if (curh2[j]==1 && h[j]==1) {
					h[j]=1;
					if (curv==0)
						curv=j;
				}
				else
					h[j]=0;

			maxv=curv;
			if (maxv==0) break;
		}

	}

	fprintf(outf,"%d",maxv);
	fclose(outf);

	return 0;
}

