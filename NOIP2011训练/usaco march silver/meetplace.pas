{
ID: xiaweiy1
PROG: meetplace
LANG: PASCAL
}
const maxn=2020; maxm=1020;
var tmp,sum,n,m,i,j,x,y,a,b:longint;
    g:array[0..13]of longint;
    d,pos,h:array[1..maxn]of longint;
    p:array[1..maxm]of longint;
    edge:array[1..maxn,0..maxn]of integer;
    f:array[1..maxn,0..13]of longint;
procedure dfs(now:longint);
var i,t:longint;
begin
inc(sum); d[sum]:=now;
pos[now]:=sum;
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    dfs(t);
    inc(sum);
    d[sum]:=now;
    end;
end;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
function check(t:longint):longint;
var i:longint;
begin
for i:=0 to 12 do
    if (t>=g[i])and(t<g[i+1]) then exit(i);
end;
function solve(a,b:longint):longint;
var len,tmp:longint;
begin
len:=b-a+1;
tmp:=check(len);
exit(min(f[a,tmp],f[b+1-g[tmp],tmp]));
end;
begin
assign(input,'meetplace.in');
reset(input);
assign(output,'meetplace.out');
rewrite(output);
readln(n,m);
for i:=2 to n  do
    begin
    readln(p[i]);
    inc(edge[p[i],0]);
    edge[p[i],edge[p[i],0]]:=i;
    end;
g[0]:=1;
for i:=1 to 13 do g[i]:=g[i-1] shl 1;
sum:=0;
dfs(1);
for i:=1 to sum do h[i]:=pos[d[i]];
for i:=1 to sum do f[i,0]:=h[i];
tmp:=check(sum);
for j:=1 to tmp do
    begin
    for i:=1 to sum+1-g[j] do
        begin
        f[i,j]:=min(f[i,j-1],f[i+g[j-1],j-1]);
        end;
    end;
for i:=1 to m do
    begin
    readln(x,y);
    a:=pos[x]; b:=pos[y];
    if a>b then begin a:=a+b; b:=a-b; a:=a-b; end;
    writeln(d[solve(a,b)]);
    end;
close(input);
close(output);
end.
