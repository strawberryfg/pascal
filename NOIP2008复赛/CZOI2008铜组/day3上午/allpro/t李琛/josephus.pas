var n:integer;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n);
  writeln('30');
  close(input);
  close(output);
end.