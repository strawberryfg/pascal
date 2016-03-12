var t,i,n,k,j,m,ans:longint;
    p:array[1..101,1..101]of longint;
    g:array[1..101,1..101]of boolean;
    final:array[1..101]of longint;
    state:array[1..101]of boolean;
function work(a,b:longint):boolean;
var i:longint;
begin
for i:=1 to k do
    begin
    if p[a,i]<=p[b,i] then exit(false);
    end;
exit(true);
end;
function dfs(p:longint):boolean;
var i:longint;
begin
for i:=1 to n do
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
assign(input,'stock.in');
reset(input);
assign(output,'stock.out');
rewrite(output);
readln(t);
for i:=1 to t do
    begin
    readln(n,k);
    fillchar(g,sizeof(g),false);
    fillchar(p,sizeof(p),0);
    fillchar(final,sizeof(final),0);
    for j:=1 to n do
        begin
        for m:=1 to k do
            begin
            read(p[j,m]);
            end;
        readln;
        end;
    for j:=1 to n do
        begin
        for m:=1 to n do
            begin
            if j<>m then g[j,m]:=work(j,m);
            end;
        end;
    ans:=0;
    for j:=1 to n do
        begin
        fillchar(state,sizeof(state),false);
        if dfs(j) then inc(ans);
        end;
    writeln(n-ans);
    end;
close(input);
close(output);
end.