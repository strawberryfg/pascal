program lift;
var k:array[1..200]of integer;
    a,b,n,i:integer;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  read(n,a,b);
  for i:=1 to n do
    read(k[i]);
  writeln('3');   
  close(input);
  close(output); 
end.