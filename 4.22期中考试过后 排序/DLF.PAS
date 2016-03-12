const maxn=10;
var a:array[1..10] of longint;
    i,j,t,x,max:longint;
begin
randomize;
for i:=1 to 10 do
    a[i]:=random(100);
for i:=1 to maxn-1 do
    begin
    max:=a[i];
    t:=i;
    for j:=i+1 to maxn do
        if max<a[j] then begin max:=a[j];t:=j; end;
    x:=a[i];a[i]:=a[t];a[t]:=x;
    end;
for i:=1 to 10 do
    writeln(a[i]);
end.