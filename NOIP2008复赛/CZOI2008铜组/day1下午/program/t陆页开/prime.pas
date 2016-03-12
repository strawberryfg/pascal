const max=17;
var a:array[0..16] of longint;
    n,m,total:longint;
function pd(x:longint):boolean;
  var i,j:longint;
  begin
  pd:=true;
  for i:=1 to n-1 do
      for j:=i+1 to n do
      if a[i]=a[j] then begin pd:=false;exit;end;
  end;
function prime(x:longint):boolean;
  var k:longint;
  begin
  prime:=true;
  for k:=2 to trunc(sqrt(x)) do
      if x mod k=0 then begin prime:=false;exit;end;
  end;
procedure print;
  var k:longint;
  begin
  for k:=1 to n-1 do write(a[k],' ');
  writeln(a[n]);
  end;
procedure try(i:longint);
  var j:longint;
  begin
  if i>n then print
         else for j:=1 to n do
              begin
              if (pd(a[i])) and prime(a[i]+a[i+1]) then
                                                   begin
                                                   a[i]:=j;
                                                   try(i+1);
                                                   end;
              end;
  end;
begin
assign(input,'prime.ion');
reset(input);
assign(output,'prime.out');
rewrite(output);
readln(n);
a[1]:=1;
for m:=1 to n do a[m]:=0;
    try(2);
close(input);
close(output);
end.