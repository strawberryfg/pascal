var t,j,i:longint;
    a:array[1..1000] of longint;
function prime(n:longint):boolean;
  var k:longint;
  begin
  prime:=true;
  for k:=2 to n-1 do
      if n mod k=0 then begin prime:=false;exit;end;
  end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
i:=0;
while not eof do
      begin
      inc(i);
      readln(a[i]);
      end;
t:=0;
for j:=1 to i do
    if prime(a[j])=true then t:=t+1;
writeln(t);
close(input);
close(output);
end.
