var k:longint;
begin
  assign(input,'josephus.in');
  reset(input);
  assign(output,'josephus.out');
  rewrite(output);
  readln(k);
  writeln(k*8-2);
  close(input);
  close(output);
end.
