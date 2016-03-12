const maxn=2000;
var n,m,i,j,x,y,c,le,ri,mid,ans,st,en,p,tmp,now:longint;
    a,topsort,g:array[1..maxn]of longint;
    edge,f:array[1..maxn,0..maxn]of longint;
    vis:array[1..maxn]of boolean;
    flag:boolean;
procedure dfs(now:longint);
var i:longint;
begin
vis[now]:=true;
for i:=1 to edge[now,0] do
    begin
    if not vis[edge[now,i]] then dfs(edge[now,i]);
    end;
inc(p);
topsort[p]:=now;
if now=1 then st:=p else if now=n then en:=p;
end;
begin
assign(input,'fruit.in');
reset(input);
assign(output,'fruit.out');
rewrite(output);
readln(n,m);
for i:=1 to n do read(a[i]);
for i:=1 to m do
    begin
    readln(x,y,c);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    f[x,edge[x,0]]:=c;
    end;
for i:=1 to n do if not vis[i] then dfs(i);
le:=1; ri:=2000000000;
while le<=ri do
  begin
  mid:=(le+ri)div 2;
  for i:=1 to n do g[i]:=maxlongint;
  g[1]:=a[1];
  flag:=true;
  for i:=st downto en do
      begin
      now:=topsort[i];
      if g[now]>mid then
         begin
         continue;
         end;
      for j:=1 to edge[now,0] do
          begin
          tmp:=g[now]-f[now,j];
          if tmp<0 then tmp:=0;
          tmp:=tmp+a[edge[now,j]];
          if tmp<g[edge[now,j]] then
             g[edge[now,j]]:=tmp;
          end;
      end;
  if (g[n]<=mid) then begin ans:=mid; ri:=mid-1; end
     else le:=mid+1;
  end;
writeln(ans);
close(input);
close(output);
end.