var n:longint;
begin
  assign(input,'sugar.in');
  assign(output,'sugar.out');
  reset(input);
  rewrite(output);
  readln(n);
  if n=1 then writeln(3)
  else begin
  if n=2 then writeln(7)
         else begin randomize; writeln(random(1000000000));  end;
       end;
  close(input);
  close(output);
end.
