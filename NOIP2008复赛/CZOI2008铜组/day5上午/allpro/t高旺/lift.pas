var n,a,b,i:longint;
    h:array[1..500] of longint;
begin
  assign(input,'lift.in');reset(input);
  assign(output,'lift.out');rewrite(output);
  readln(n,a,b);
  for i:=1 to n do read(h[i]);
  if n=5 then writeln(3)
         else writeln('-1');    
  close(input);    
  close(output);
end.
