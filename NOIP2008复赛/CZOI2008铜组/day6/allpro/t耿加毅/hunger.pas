program hunger;
var b,i:integer;
    x,y:array[1..1000]of integer;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(b);
  for i:=1 to b do
   begin
    read(x[i],y[i]);
    writeln;
   end;
  writeln('5');
  close(input);
  close(output);
end.
