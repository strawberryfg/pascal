const maxn=1050;
var n,m,i,j,x,y,z,p,num,t,ans:longint;
    vis:array[0..maxn]of boolean;
    edge,f:array[0..maxn,0..maxn]of longint;
    g,a:array[0..maxn]of longint;
procedure dfs(num:longint);
var i:longint;
begin
vis[num]:=true;
for i:=1 to edge[num,0] do
    begin
    if not vis[edge[num,i]] then dfs(edge[num,i]);
    end;
inc(p);
a[p]:=num;
end;
function max(u,v:longint):longint;
begin
if u>v then exit(u) else exit(v);
end;
begin
assign(input,'homework.in');
reset(input);
assign(output,'homework.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y,z);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    f[x,edge[x,0]]:=z;
    end;
for i:=0 to n-1 do
    if not vis[i] then dfs(i);
for i:=p downto 1 do
    begin
    num:=a[i];
    for j:=1 to edge[num,0] do
        begin
        t:=edge[num,j];
        g[t]:=max(g[t],g[num]+f[num,j]);
        end;
    end;
ans:=0;
for i:=0 to n-1 do
    begin
    ans:=max(ans,g[i]+1);
    end;
writeln(ans);
close(input);
close(output);
end.
