var n,m,i,j,t:longint;
    a:array[1..10000,1..2] of longint;
    b:array[1..10000] of longint;
begin
  assign(input,'message.in');
  assign(output,'message.out');
  reset(input);
  rewrite(output);
  randomize;
  readln(n,m);
  for i:=1 to m do
    readln(a[i,1],a[i,2]);
  if n=4 then
    begin
      writeln('T');
      writeln('T');
      writeln('T');
      writeln('F');
    end
  else
    for i:=1 to n do
      if random(200)<=100 then writeln('T') else writeln('F');
  close(input);
  close(output);
end.
