const maxn=2020;
var n,e,i,x,y,spe,tot,tt:longint;
    edge:array[1..maxn,0..maxn]of longint;
    mark:array[1..maxn]of boolean;
    res,ff:array[1..maxn]of longint;
procedure dfs(now:longint);
var i,t:longint;
begin
inc(tt);
mark[now]:=true;
if mark[n] then exit;
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    if (t<>spe)and(not mark[t]) then dfs(t);
    if mark[n] then exit;
    end;
end;
begin
assign(input,'busstop.in');
reset(input);
assign(output,'busstop.out');
rewrite(output);
readln(n,e);
for i:=1 to e do
    begin
    readln(x,y);
    inc(edge[x,0]); edge[x,edge[x,0]]:=y;
    inc(edge[y,0]); edge[y,edge[y,0]]:=x;
    end;
for i:=2 to n-1 do
    begin
    spe:=i;
    tt:=0;
    fillchar(mark,sizeof(mark),false);
    dfs(1);
    ff[i]:=tt;
    if not mark[n] then
       begin
       inc(tot);
       res[tot]:=i;
       end;
    end;
writeln(tot);
for i:=1 to tot-1 do write(res[i],' ');
write(res[tot]);
writeln;
//for i:=2 to n-1 do writeln(ff[i]);
close(input);
close(output);
end.
