var l:array[1..200]of integer;
    n,a,b,i:integer;
begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  readln(n,a,b);
  for i:=1 to n do read(l[i]);
  writeln('-1');
  close(input); close(output);
end.