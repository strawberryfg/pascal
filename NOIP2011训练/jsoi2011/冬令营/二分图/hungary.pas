var i,n,m,tot,x,y,ans:longint;
    state:array[1..100]of boolean;
    g:array[1..100,1..100]of boolean;
    final:array[1..100]of longint;
function dfs(p:longint):boolean;
var i:longint;
begin
for i:=1 to m do
    begin
    if (g[p,i])and(not state[i]) then
       begin
       state[i]:=true;
       if (final[i]=0)or(dfs(final[i])) then
          begin
          final[i]:=p;
          exit(true);
          end;
       end;
    end;
exit(false);
end;
begin
assign(input,'hungary.in');
reset(input);
{assign(output,'hungary.out');
rewrite(output);}
readln(n,m,tot);
for i:=1 to tot do
    begin
    readln(x,y);
    g[x,y]:=true;
    end;
for i:=1 to n do
    begin
    fillchar(state,sizeof(state),false);
    if dfs(i) then inc(ans);
    end;
writeln(ans);
close(input);
close(output);
end.