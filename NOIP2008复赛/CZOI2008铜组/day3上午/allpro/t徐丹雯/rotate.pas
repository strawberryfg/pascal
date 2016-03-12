var n,i,j,k:longint;
a:array[1..20,1..20]of integer;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
  read(n);
for i:=1 to n do
for j:=1 to n do begin
if j=n then begin
a[i,j]:=a[i+1,j];
if i=n then
a[i,j]:=a[i,j-1];end;  end;
for k:=1 to n*n do
write(k:4);
close(input);
close(output);
end.
