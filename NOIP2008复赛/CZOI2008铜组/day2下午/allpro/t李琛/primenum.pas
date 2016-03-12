var a:array[1..1000] of integer;
    total,s,i:integer;
function f(x:integer):boolean;
var  i:integer;
begin
  f:=true;
  for i:=1to trunc(sqrt(x)) do
    if x mod i=0 then f:=false;
end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
s:=0;
while (not eof) do
begin
s:=s+1;
readln(a[s]);
end;
total:= 0;
for i:= 1to s do
  if f(a[i]) then total:=total+1;
writeln(total);
close(input);
close(output);
end.
