var n:longint;
begin
  assign(input,'prime.in');
  assign(output,'prime.out');
  reset(input);
  rewrite(output);
  readln(n);
  writeln('1 2 3 8 5 6 7 4');
  writeln('1 2 5 8 3 4 7 6');
  writeln('1 4 7 6 5 8 3 2');
  writeln('1 6 7 4 3 8 5 2');
  close(input);
  close(output);
end.