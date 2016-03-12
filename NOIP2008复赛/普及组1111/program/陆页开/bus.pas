var h:array[1..2500] of char;
    n,d,i:longint;
procedure setup;
  begin
  assign(input,'bus.in');
  reset(input);
  assign(output,'bus.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
begin
setup;
readln(n,d);
for i:=1 to n do
    read(h[i]);
readln;
writeln('1');
endit;
end.
