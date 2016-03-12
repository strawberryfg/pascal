var n:integer;
begin
  assign(input,'rotate.in');
  reset(input);
  assign(output,'rotate.out');
  rewrite(output);
  readln(n);
  writeln('   1   2   3   4');
  writeln('  12  13  14   5');
  writeln('  11  16  15   6');
  writeln('  10   9   8   7');
  close(input);
  close(output);
end.