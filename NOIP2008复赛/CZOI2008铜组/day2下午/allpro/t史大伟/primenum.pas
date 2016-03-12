var i,n,total:longint;
    procedure prime(dep:longint);
var p,i:longint;
begin
p:=0;
for i:=2 to trunc(sqrt(dep)) do
    if (dep mod i=0)and(dep<>2) then begin p:=1;break;end;
    if p=0 then inc(total);
end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
while not eof do
begin
read(n);
if n<>0 then prime(n);
end;
writeln(total);
close(input);
close(output);
end.
