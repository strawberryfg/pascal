var n,i,sum:longint;
    a:array[1..1000]of longint;
function prime(n:longint):boolean;
var i:longint;
begin
prime:=true;
if n=1 then begin prime:=false;exit;end;
for i:=2 to trunc(sqrt(n)) do
    if n mod i=0 then begin prime:=false;exit;end;
end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
n:=0;
while not eof do
      begin
      inc(n);
      readln(a[n]);
      end;
for i:=1 to n do
    if prime(a[i]) then inc(sum);
writeln(sum);
close(input);
close(output);
end.