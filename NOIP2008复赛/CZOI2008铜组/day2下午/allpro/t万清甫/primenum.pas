var n,sum:longint;
    a:array[1..10000]of integer;
procedure prime;
var i,j:longint;
begin
for i:=2 to 10000 do
    begin
    for j:=2 to trunc(sqrt(i)) do
        if i mod j=0 then begin a[i]:=1;break; end;
    end;
end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
prime;
while not eof do
      begin
      readln(n);
      if (a[n]=0)and(n<>1) then inc(sum);
      end;
writeln(sum);
close(input);
close(output);
end.
