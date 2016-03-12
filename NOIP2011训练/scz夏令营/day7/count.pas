//11:50 11:54; 4min
const maxn=10;
var c:char;
    n,i,j,ans:longint;
    fa:array[1..maxn]of longint;
    g:array[1..maxn,1..maxn]of longint;
function getfa(x:longint):longint;
begin
while (fa[x]<>x) do x:=fa[x];
exit(x);
end;
procedure dfs(root,depth:longint);
var i,t1,t2:longint;
begin
if depth=n+1 then begin inc(ans); exit; end;
if root=depth then begin dfs(root,depth+1); exit; end;
for i:=1 to n do
    begin
    if (i<>depth)and(g[i,depth]=1) then
       begin
       t1:=getfa(i);
       t2:=getfa(depth);
       if t1<>t2 then
          begin
          fa[t2]:=t1;
          dfs(root,depth+1);
          fa[t2]:=t2;
          end;
       end;
    end;
end;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(c);
        g[i,j]:=ord(c)-48;
        end;
    readln;
    end;
ans:=0;
for i:=1 to n do fa[i]:=i;
for i:=1 to n do
    begin
    dfs(i,1);
    end;
writeln(ans);
close(input);
close(output);
end.