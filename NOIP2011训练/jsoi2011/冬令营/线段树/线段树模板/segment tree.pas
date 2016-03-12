procedure init(f,t:longint);
begin
inc(tot);
now:=tot;
m[now].l:=f;
m[now].r:=t;
if f=t then exit
   else begin
        m[now].lc:=tot+1;
		init(f,(f+t)div 2);
		m[now].rc:=tot+1;
		init((f+t)div 2+1,t);
        end;
end;

procedure lazytag(x:longint);
begin
if m[x].col>0 then //有信息
   begin
   m[m[x].lc].col:=m[x].col;
   m[m[x].rc].col:=m[x].col;
   m[x].col:=-1;      //混合颜色
   end;
end;

procedure insert(f,t,x:longint);
begin
if (f<=m[x].l)and(t>=m[x].r) then 
    begin
	m[x].col:=knum;
	exit;
	end;
lazytag(x);
mid:=(m[x].l+m[x].r)div 2;
if f<=mid then insert(f,t,m[x].lc);
if t>mid then insert(f,t,m[x].rc);      //欲染色的区间为[f,t] 所以[f,t]传过去时不变化
end;

procedure count(f,t,x:longint);
begin
if m[x].col>0 then
   begin
   inc(hash[m[x].col]);
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if f<=mid then count(f,t,m[x].lc);
if t>mid then count(f,t,m[x].rc); //欲count 记hash表的是[f,t]区间 所以f,t恒定不变
end;

function findmin(f,t,x:longint):longint;   //求最小值 判断与左边和右边是否有相交
begin
if (f<=m[x].l)and(t>=m[x].r) then exit(m[x].max);
mid:=(m[x].l+m[x].r)div 2;
ans:=maxlongint;
if (f<=mid) then ans:=fmin(ans,findmin(f,t,m[x].lc));
if (t>mid) then ans:=fmin(ans,findmin(f,t,m[x].rc));
exit(ans);
end;

function findmax(f,t,x:longint):longint;
begin
if (f<=m[x].l)and(f>=m[x].r) then exit(m[x].min);
mid:=(m[x].l+m[x].r)div 2;
ans:=-maxlongint;
if (f<=mid) then ans:=fmax(ans,findmax(f,t,m[x].lc));
if (t>mid) then ans:=fmax(ans,findmax(f,t,m[x].rc));
end;

procedure insert(f,t,x:longint);
begin
if m[x].col=0 then
   begin
   if (f<=m[x].l)and(t>=m[x].r) then begin m[x].col:=1; exit; end;
   mid:=(m[x].l+m[x].r)div 2;
   if f<=mid then insert(f,t,m[x].lc);
   if t>mid then insert(f,t,m[x].rc);
   if (m[m[x].lc].col=1)and(m[m[x].rc].col=1) then m[x].col:=1;
   end;
end;   //类似于染色

