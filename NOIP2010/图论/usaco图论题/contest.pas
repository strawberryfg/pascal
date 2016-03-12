const maxn=120;
var n,m,x,y,i,j,k,sum,cnt:longint;
    f,g:array[1..maxn,1..maxn]of longint;
begin
assign(input,'contest.in');
reset(input);
assign(output,'contest.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y);
    f[x,y]:=1; g[y,x]:=1;
    end;
for k:=1 to n do
    begin
    for i:=1 to n do
        begin
        for j:=1 to n do
            begin
            if (k<>i)and(i<>j)and(i<>k) then
               if (f[i,k]=1)and(f[k,j]=1) then f[i,j]:=1;
            end;
        end;
    end;
for k:=1 to n do
    begin
    for i:=1 to n do
        begin
        for j:=1 to n do
            begin
            if (k<>i)and(i<>j)and(i<>k) then
               if (g[i,k]=1)and(g[k,j]=1) then g[i,j]:=1;
            end;
        end;
    end;
cnt:=0;
for i:=1 to n do
    begin
    sum:=0;
    for j:=1 to n do
        begin
        if (i<>j)and(f[i,j]=1)or(g[i,j]=1) then inc(sum);
        //f[i,j]=1 indicates that i is stronger than j;
        //g[i,j]=1 indicates that j is stronger than i build an opposite graph;
        end;
    if sum=n-1 then inc(cnt);
    end;
writeln(cnt);
close(input);
close(output);
end.