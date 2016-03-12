const maxn=50;
type arraytype=array[1..maxn] of longint;
var n,total:longint;
    a:arraytype;
function pd(n:longint):boolean;
  var i:longint;
  begin
  pd:=true;
for i:=1 to n-1 do
    if (a[i]=a[n])or (abs(n-i)=abs(a[i]-a[n])) then begin pd:=false; exit; end;
  end;
procedure print;
  var k:longint;
  begin
  inc(total);
  write(total,':');
  for k:=1 to n do
      write(a[k]);
  writeln;
  end;
procedure try(dep:longint);
var i:longint;
  begin
  if dep>n then print
           else for i:=1 to n do
                    begin
                    a[dep]:=i;
                    if pd(dep) then try(dep+1);
                    end;
  end;
begin
read(n);
try(1);
end.