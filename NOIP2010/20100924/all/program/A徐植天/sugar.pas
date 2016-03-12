var
   n:longint;
begin
  assign(input,'sugar.in');reset(input);
  assign(output,'sugar.out');rewrite(output);
  readln(n);
  writeln((4+n)*(n-1) div 2+3);
  close(input);close(output);
end.
