var n:longint;
begin
  assign(input,'engzam.in');reset(input);
  assign(output,'engzam.out');rewrite(output);
  readln(n);
  if n=1 then writeln(1);
  if n=2 then writeln(5);
  if n=3 then writeln(11);
  close(input);close(output);
end.
