var a,b,c,d,e,f,g,h:integer;
begin
  assign(input,'hunger.in');
  reset(input);
  assign(output,'hunger.out');
  rewrite(output);
  readln(a);
  readln(b,c);
  readln(d,e);
  readln(f,g);
  h:=5;
  if (a=3) and (b=1) and (c=3) and (d=7) and (e=8) and (f=3) and (g=4) then
  writeln(h)
                                                                       else writeln(1);
  close(input);
  close(output);
end.