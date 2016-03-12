const maxn=50;
type arraytype=array[1..maxn] of longint;
var n,r:longint;
    a:arraytype;
procedure print;
 var i:longint;
  begin
  for i:=1 to r do
      write(a[i]);
  write(' ');
  end;
procedure try(dep,b,e:longint);
var i:longint;
  begin
  if dep>r then print
           else for i:=b to e do
                    begin
                    a[dep]:=i;
                    try(dep+1,i+1,e+1);
                    end;
  end;
begin
read(n,r);
try(1,1,n-r+1);
end.