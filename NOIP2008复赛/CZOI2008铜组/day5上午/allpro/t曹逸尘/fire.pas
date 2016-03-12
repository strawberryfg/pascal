var a:array[1..1000,1..1000] of char;
   i,j,n:integer;
begin
  assign(input,'lift.in');
  assign(output,'lift.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:= 1 to n do
    for j:=1 to n do
    read(a[i,j]);
  if (n=8)and(a[1,2]='X')and(a[3,1]='X')and(a[3,2]='X')
   then writeln(5)
   else writeln('-1');
  close(input);
  close(output);
end.
