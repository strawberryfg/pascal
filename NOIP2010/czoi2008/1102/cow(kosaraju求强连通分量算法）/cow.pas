const maxn=10020; maxm=50020;
type rec=record u,v,nxt:longint; end;
     re=record fir,last,cnt:longint; end;
var n,m,i,x,y,tot,tot2,cnt,res,sum,p:longint;
    vis:array[1..maxn]of boolean;
    belong,f,num,topsort:array[1..maxn]of longint;
    edge,edge2:array[1..maxn]of re;
    a,b:array[1..maxm]of rec;
    pd:boolean;
procedure dfs(x:longint);
var i,t:longint;
begin
vis[x]:=true;
i:=edge[x].fir;
while i<>0 do
  begin
  t:=a[i].v;
  if not vis[t] then dfs(t);
  i:=a[i].nxt;
  end;
inc(p);
topsort[p]:=x;
end;
procedure dfs2(x:longint);
var i,t:longint;
begin
i:=edge2[x].fir;
belong[x]:=cnt;
inc(num[cnt]);
while i<>0 do
 begin
 t:=b[i].v;
 if belong[t]=0 then dfs2(t);
 i:=b[i].nxt;
 end;
end;
begin
{assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);}
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y);
    inc(tot);
    a[tot].u:=x; a[tot].v:=y;
    inc(edge[x].cnt);
    if edge[x].fir=0 then
       begin
       edge[x].fir:=tot;
       edge[x].last:=tot;
       a[tot].nxt:=0;
       end
    else
       begin
       a[edge[x].last].nxt:=tot;
       edge[x].last:=tot;
       a[tot].nxt:=0;
       end;
    inc(tot2);
    b[tot2].u:=y; b[tot2].v:=x;
    inc(edge2[y].cnt);
    if edge2[y].fir=0 then
       begin
       edge2[y].fir:=tot2;
       edge2[y].last:=tot2;

       end
    else
       begin
       b[edge2[y].last].nxt:=tot2;
       edge2[y].last:=tot;
       b[tot2].nxt:=0;
       end;
    end;
for i:=1 to n do
    begin
    if vis[i]=false then dfs(i);
    end;
for i:=p downto 1 do
    begin
    if belong[topsort[i]]=0 then
       begin
       inc(cnt);
       dfs2(topsort[i]);
       end;
    end;
for i:=1 to m do
    begin
    x:=a[i].u; y:=a[i].v;
    if belong[x]<>belong[y] then   //u - > v
       inc(f[belong[x]]);
    end;
pd:=true; sum:=0;
for i:=1 to cnt do
    begin
    if f[i]=0 then
       begin
       inc(sum);
       res:=i;
       end;
    if sum>1 then begin pd:=false;break; end;
    end;
if not pd then writeln(0) else writeln(num[res]);
{close(input);
close(output);}
end.