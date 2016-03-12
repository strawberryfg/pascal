const maxn=100;
type arr=array[0..maxn]of longint;
var a:arr;
    n,total:longint;
procedure print(k:longint);
var i:longint;
begin
write(n,'=');
for i:=1 to k-1 do
    write(a[i],'+');
writeln(a[k]);
inc(total);
end;
function min(m,n:longint):longint;
begin
if m<n then min:=m
       else min:=n;
end;
procedure try(dep,n:longint);
var i:longint;
begin
if n=0   then {print(dep-1)}
         else for i:=min(n,a[dep-1]) downto 1 do
                  begin
                  a[dep]:=i;
                  try(dep+1,n-i);
                  end;
end;
begin
read(n);
a[0]:=maxlongint;
try(1,n);
writeln(total);
end.
