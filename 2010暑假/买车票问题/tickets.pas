var st,en,i,j,k,n:longint;
    l,c:array[1..3]of longint;
    way,cost:array[1..100]of longint;
    p:array[1..100,1..100]of longint;
begin
assign(input,'e:\tickets.in');
reset(input);
readln(l[1],l[2],l[3],c[1],c[2],c[3]);
readln(n);
readln(st,en);
if st>en then begin st:=st+en;en:=st-en;st:=st-en; end;
for i:=2 to n do read(way[i]);
for j:=1 to 3 do
    begin
    k:=en-1;
    for i:=en downto 1 do
        begin
        while (way[i]-way[k]<=l[j])and(k>=st) do dec(k);
        p[i,j]:=k+1;
        end;
    end;
for i:=st+1 to en do
    begin
    cost[i]:=maxlongint;
    for j:=1 to 3 do
        if (p[i,j]<>i)and(cost[i]>cost[p[i,j]]+c[j]) then
           cost[i]:=cost[p[i,j]]+c[j];
    end;
writeln(cost[en]);
close(input);
end.