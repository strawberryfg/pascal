var s,i,k,j:longint;
    f:boolean;
    a:array[1..1000]of longint;
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
s:=0;
for j:=1 to i do
  begin
    f:=true;
    for k:=2 to trunc(sqrt(a[j])) do
      if a[j] mod k=0 then begin f:=false;break;end;
    if (f=true)and (a[j]<>1) and (a[j]<>0)then inc(s);
  end;
writeln(s);
close(input);
close(output);
end.
