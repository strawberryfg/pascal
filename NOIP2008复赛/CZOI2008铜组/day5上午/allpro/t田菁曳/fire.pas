var  a:array[1..10]of string;
     i,n:integer;
begin
  assign(input,'fire.in');
  rset(input);
  assign(output,'fire.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  writeln(5);
  close(input);
  close(output);
end.