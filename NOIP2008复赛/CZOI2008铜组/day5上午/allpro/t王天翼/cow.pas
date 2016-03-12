var q,t,n,i,j,k:longint;
    a,b:array[1..500] of integer;
begin
  assign(input,'cow.in');
  reset(input);
  assign(output,'cow.out');
  rewrite(output);
  readln(n);
  t:=1;
  j:=0;
  for i:=4 to n do
      inc(t);
  k:=t;
  for i:=1 to k do
    for j:=i+3 to k do
      inc(t);
  writeln(t);
  close(input);
  close(output);
end.
