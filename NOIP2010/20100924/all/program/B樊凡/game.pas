var
  n,i:longint;
  s:string;
begin
  assign(input,'game.in');
  reset(input);
  assign(output,'game.out');
  rewrite(output);
  randomize;
  readln(n);
  for i:=1 to n do
    readln(s);
  for i:=1 to n do
    begin
      if odd(random(10))then writeln('Yes') else writeln('No');
    end;
  close(input);
  close(output);
end.