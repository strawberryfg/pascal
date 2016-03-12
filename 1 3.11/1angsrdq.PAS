var i,a,k,l:longint;
begin
read(a);
for i:=1 to a do
begin
 if i<a then
 for k:=1 to a-i do
  write(' ');
   for l:=1 to i do
    write('*');
writeln;
end;
end.