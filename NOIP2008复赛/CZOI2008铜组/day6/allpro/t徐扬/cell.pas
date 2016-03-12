var n,m:longint;
begin
 assign(input,'cell.in');
 assign(output,'cell.out');
 reset(input);
 rewrite(output);
 readln(n,m);
 writeln(n);
 close(input);
 close(output);
end.