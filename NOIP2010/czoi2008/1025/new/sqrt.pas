Var n,i,y:longint;
Begin
  assign(input,'sqrt.in');assign(output,'sqrt.out');
  reset(input);rewrite(output);
  readln(n);
  close(input);
  for i:=trunc(sqrt(n)) downto 1 do
      if n mod sqr(i)=0 then
         begin
           y:=n div sqr(i);
           writeln(int64(n)+y+2*trunc(sqrt(int64(n)*y)));close(output);halt;
         end;
End.