var k:array[1..1000]of longint;
    n,a,b,i:longint;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  read(n,a,b);
  for i:=1 to n do
  read(k[i]);
  for i:=1 to n do
  if (i+k[i]>n)or(i-k[i]<=0)then
  writeln(-1);
  readln;
  close(input);
  close(output);
end.
