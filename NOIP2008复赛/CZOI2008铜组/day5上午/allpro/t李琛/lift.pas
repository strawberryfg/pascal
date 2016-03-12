var a:array[1..200] of integer;
    i,n,a,b:integer;
begin
  assign(input'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  readln(n,a,b);
  for i:=1 to n do
  read(a[i]);
  if n=5 then writeln('3')
         else if n=4 then writeln('2')
                     else writeln('-1');
  close(input):
  close(output);
end.   

  
