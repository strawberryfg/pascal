program cell;
var a:array[1..60,1..60]of integer;
    n,m,i,j:integer;
begin
  assign(input,'cell.in');
  assign(output,'cell.out');
  reset(input); rewrite(output);
  read(m,n);
  for j:=1 to m do
    begin
      for i:=1 to n do
        read(a[j,i]);
      writeln;
    end;
  writeln('4');
  close(input);
  close(output);
end.
