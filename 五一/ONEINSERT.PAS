const maxn=10;
var a:array[1..maxn+1] of longint;
    i,j,k,x,t:longint;
begin
randomize;
for i:=1 to maxn do a[i]:=random(100);
for i:=1 to maxn-1 do
    for j:=i+1 to maxn do
        if a[i]<a[j] then begin t:=a[i];a[i]:=a[j];a[j]:=t; end;
x:=random(100);
k:=maxn;
while (k>0)and(x>a[k]) do
      begin
      a[k+1]:=a[k];
      k:=k-1;
      end;
a[k+1]:=x;
for i:=1 to maxn do write(a[i]:4);
writeln;
end.