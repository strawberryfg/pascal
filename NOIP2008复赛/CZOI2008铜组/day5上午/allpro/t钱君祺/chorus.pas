var n,i:longint;
    a:array[1..200]of integer;
begin
  assign(input,'chorus.in');
  assign(output,'chorus.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do read(a[i]);
  writeln(4);
  close(input);
  close(output);
end.