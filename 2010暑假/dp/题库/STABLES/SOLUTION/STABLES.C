#include <stdio.h>
#define	MAX 41
#define max 2147483647

int w,h,i,j,wh;
int v[MAX][MAX];
char done[MAX][MAX];
int	opt[MAX][MAX];
int total=0;
int minopt,minx,miny,x,y;
int dx[4]={0,-1,0,1};
int dy[4]={1,0,-1,0};
int k,nx,ny,dist;

void relax(int x, int y)
{
	for (k=0; k<4; k++) {
		nx=x+dx[k]; ny=y+dy[k];
		if (nx>=1 && ny>=1 && nx<=h && ny<=w && done[nx][ny]==0) {
/*			if (v[x][y]>v[nx][ny])
				dist=0;
			else
				dist=v[nx][ny]-v[x][y];*/
			if (v[x][y]>v[nx][ny])
				dist=v[nx][ny];
			else
				dist=v[x][y];

			if (dist<opt[nx][ny])
				opt[nx][ny]=dist;
		}
	}
}

int main()
{
	FILE* inf=fopen("stables.in","r");
	FILE* outf=fopen("stables.out","w");

	fscanf(inf,"%d %d\n",&w,&h);
	for (i=1; i<=h; i++) {
		for (j=1; j<=w; j++)
			fscanf(inf,"%d",&v[i][j]);
		fscanf(inf,"\n");
	}
	fclose(inf);

	done[1][1]=1; total=0;
	for (i=1; i<=h; i++)
		for (j=1; j<=w; j++)
			opt[i][j]=max;

	opt[1][1]=0; relax(1,1);
	wh=w*h;
	for (i=2; i<=wh; i++) {
		minopt=max;
		for (x=1; x<=h; x++)
			for (y=1; y<=w; y++)
				if (done[x][y]==0 && opt[x][y]<minopt) {
					minopt=opt[x][y];
					minx=x; miny=y;
				}
		done[minx][miny]=1;
		total+=opt[minx][miny];
		relax(minx,miny);
	}

	fprintf(outf,"%d",total);
	fclose(outf);
	return 0;
}

