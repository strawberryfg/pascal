const maxn=50;
type arraytype=array[1..maxn] of longint;
var n:longint;
    a:arraytype;
function prime(n:longint):boolean;
var i:longint;
begin
prime:=true;
for i:=2 to trunc(sqrt(n)) do
    if n mod i=0 then begin prime:=false;exit;end;
end;
procedure print;
 var i:longint;
  begin
  if prime(a[n]+1) then
  begin
  for i:=1 to n do
      write(a[i]);
  writeln;
  end;
  end;
function pd(n:longint):boolean;
var i:longint;
begin
pd:=true;
for i:=1 to n-1 do
    if a[i]=a[n] then begin pd:=false;exit; end;
end;
procedure try(dep:longint);
var i:longint;
  begin
  if dep>n then print
           else for i:=2 to n do
                    begin
                    a[dep]:=i;
                    if pd(dep)and prime(i+a[dep-1]) then
                    try(dep+1);
                    end;
  end;
begin
read(n);
a[1]:=1;
try(2);
end.