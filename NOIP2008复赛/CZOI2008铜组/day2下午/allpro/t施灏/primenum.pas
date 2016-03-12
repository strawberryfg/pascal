var a:array[1..1000] of longint;
    b:array[1..1000] of boolean;
    i,j,s:longint;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
i:=0;
s:=0;
while not eof do
              begin
              inc(i);
              readln(a[i]);
              end;
for j:=1 to i do
    b[j]:=true;
for j:=1 to i do
    if (a[j] mod j=0)and(a[j]<>2) then b[j]:=false;
for j:=1 to i do
    if b[j]=true then s:=s+1;
writeln(s);
close(input);
close(output);
end.
