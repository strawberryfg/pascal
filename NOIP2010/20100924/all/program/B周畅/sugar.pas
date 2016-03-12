var
  n,i:longint;
  s:int64;
begin
  assign(input,'sugar.in'); reset(input);
  assign(output,'sugar.out'); rewrite(output);
  readln(n);
  s:=0;
  for i:=1 to n+1 do s:=s+i;
  writeln(s);
  close(input);
  close(output);
end.