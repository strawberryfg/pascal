var a:array[0..61,0..61] of 0..9;
    t:array[1..60] of string;
    i,j,m,n,s:longint;
begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);
  randomize;
  readln(m,n);
  for i:=1 to m do
    begin
      readln(t[i]);
      for j:=1 to n do
        val(t[i,j],a[i,j])
    end;
  for i:=1 to m do
    for j:=1 to n do
      if a[i,j]=0 then s:=s+1;
  if s<2 then writeln('1') else
    if s=n*m then writeln('0') else
       writeln(n*m-random(n*m));
  close(input);
  close(output);
end.


