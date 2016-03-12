var n,tot:longint;
    a,t:array[1..4]of longint;
procedure pd;
var i,j,p:longint;
begin
for i:=1 to 4 do t[i]:=a[i];
for i:=1 to 3 do
    for j:=i+1 to 4 do
        if t[i]<t[j] then begin p:=t[i];t[i]:=t[j];t[j]:=p; end;
if t[4]+t[3]+t[2]>t[1] then begin writeln(a[1]:4,a[2]:4,a[3]:4,a[4]:4);inc(tot);end;
end;
procedure try(dep,remain:integer);
var i:longint;
begin
if dep=4 then begin a[4]:=remain;pd; end else
for i:=1 to remain-(4-dep) do
    begin
    a[dep]:=i;
    try(dep+1,remain-i);
    end;
end;
begin
readln(n);
try(1,n);
writeln(tot);
end.