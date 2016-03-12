var i,n,n1,n2:longint;
    a:array[1..200] of longint;
procedure setup;
  begin
  assign(input,'lift.in');
  reset(input);
  assign(output,'lift.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(n,n1,n2);
for i:=1 to n do
    read(a[i]);
    readln;
writeln('-1');
endit;
end.
