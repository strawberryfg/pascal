#include<cstdio>
#include<memory>

const int bl=101,bs=1001;
int a[bs][bl],am[bs],ab[bs],as[bs],ams[bs],i,j,n,m,p,tp,st,ed,da,la,lb,ra,rb,u;

int ck()
{
	int i;
	if(la==ra)
	{
		for(i=lb;i<=rb;i++)
			if(!a[la][i])return 1;
		return 0;
	}
	for(i=la+1;i<ra;i++)
		if(!am[i])return 1;
	for(i=lb;i<bl;i++)
		if(!a[la][i])return 1;
	for(i=0;i<=rb;i++)
		if(!a[ra][i])return 1;
	return 0;
}

void mk(int p)
{
	int i;
	for(i=0;i<bl;i++)
	{
		if(a[p][i]<=-ams[p])a[p][i]=0;
		if(a[p][i])
		{
			a[p][i]+=as[p];
			if(a[p][i]<ab[p])a[p][i]=ab[p];
		}
	}
	ab[p]=0;as[p]=0;ams[p]=0;
}

void up(int p)
{
	int i,m;
	m=1<<30;
	for(i=0;i<bl;i++)
		if(a[p][i]<m)m=a[p][i];
	am[p]=m;
}

void t1(int p,int l,int r)
{
	int i;
	for(i=l;i<=r;i++)
	{
		a[p][i]-=da;
		if(a[p][i]<0)a[p][i]=0;
		if(a[p][i]<am[p])am[p]=a[p][i];
	}
}

void t2(int p,int l,int r)
{
	int i;
	for(i=l;i<=r;i++)
		if(a[p][i])a[p][i]+=da;
	if(am[p])up(p);
}

void t3(int p,int l,int r)
{
	int i;
	for(i=l;i<=r;i++)
		if(a[p][i]&&a[p][i]<da)a[p][i]=da;
	if(am[p])up(p);
}

int main()
{
    freopen("highway.in","r",stdin);
    freopen("highway.out","w",stdout);
	scanf("%d%d%d",&n,&m,&p);

		for(i=0;i<=n/bl;i++)
		{
			for(j=0;j<bl;j++)a[i][j]=p;
			am[i]=p;ab[i]=0;as[i]=0;ams[i]=0;
		}
		for(u=0,i=0;i<m;i++)
		{
			scanf("%d%d%d%d",&tp,&st,&ed,&da);
			if(st>ed)
			{
				p=st;st=ed;ed=p;
			}
			la=st/bl;lb=st%bl;
			ra=ed/bl;rb=ed%bl;
			if(ab[la]||as[la]||ams[la])mk(la);
			if(ab[ra]||as[ra]||ams[ra])mk(ra);
			if(tp==1)
			{
				if(ck())continue;
				u++;
				if(la==ra)t1(la,lb,rb);
				else
				{
					t1(la,lb,bl-1);
					t1(ra,0,rb);
					for(j=la+1;j<ra;j++)
					{
						am[j]-=da;ab[j]-=da;as[j]-=da;
						if(am[j]<0)am[j]=0;
						if(ab[j]<0)ab[j]=0;
						if(!ab[j]&&as[j]<ams[j])ams[j]=as[j];
					}
				}
			}
			if(tp==2)
				if(la==ra)t2(la,lb,rb);
				else
				{
					t2(la,lb,bl-1);
					t2(ra,0,rb);
					for(j=la+1;j<ra;j++)
					{
						if(am[j])am[j]+=da;
						if(ab[j])ab[j]+=da;
						as[j]+=da;
					}
				}
			if(tp==3)
				if(la==ra)t3(la,lb,rb);
				else
				{
					t3(la,lb,bl-1);
					t3(ra,0,rb);
					for(j=la+1;j<ra;j++)
						if(da>am[j]&&da>ab[j])
						{
							ab[j]=da;
							if(am[j])am[j]=da;
						}
				}
		}
		for(i=0;i<=n/bl;i++)mk(i);
		printf("%d\n",u);

	return 0;
}

