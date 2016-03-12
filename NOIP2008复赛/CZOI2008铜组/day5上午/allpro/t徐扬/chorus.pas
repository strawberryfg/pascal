var i,a,n:longint;
begin
 assign(input,'chorus.in');
 assign(output,'chorus.out');
 reset(input);
 rewrite(output);
 readln(n);
 for i:=1 to n do
  read(a);
 writeln(n div 2);
 close(input);
 close(output);
end.