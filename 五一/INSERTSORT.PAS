const maxn=10;
var a:array[1..maxn] of longint;
    i,k,x,t:longint;
begin
randomize;
for i:=1 to maxn do a[i]:=random(100);
for t:=2 to maxn do
    begin
    x:=a[t];
    k:=t-1;
    while (k>0)and(x>a[k]) do
          begin
          a[k+1]:=a[k];
          k:=k-1;
          end;
    a[k+1]:=x;
    end;
for i:=1 to maxn do write(a[i]:4);
writeln;
end.