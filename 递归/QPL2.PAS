const maxn=50;
type arraytype=array[1..maxn] of longint;
var n:longint;
    b:boolean;
    a:arraytype;
procedure pd(var b:boolean);
  var i,j:longint;
  begin
  b:=false;
for i:=1 to n-1 do
      for j:=i+1 to n do
          if a[i]=a[j] then begin b:=true; break; end;
  end;
procedure print;
  var k:longint;
  begin
  pd(b);
  if b=false then  begin
                   for k:=1 to n do
                   write(a[k]);
                   write(' ');
                   end;
  end;
procedure try(dep:longint);
var i:longint;
  begin
  if dep>n then print
           else for i:=1 to n do
                    begin
                    a[dep]:=i;
                    try(dep+1);
                    end;
  end;
begin
read(n);
try(1);
end.
