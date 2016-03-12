var t:array[1..500]of integer;
    s,n,i:integer;
begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
  read(t[i]);
  s:=n div 2;
  writeln(s);
  close(input);
  close(output);
end.
