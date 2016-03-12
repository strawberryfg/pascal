var n:longint;
begin
 assign(input,'borj.in');
 reset(input);
 assign(output,'borj.out');
 rewrite(output);

 readln(n);
 if n<10 then writeln(n);
         else if n<100 then
         writeln(n-9)*2+9);
         else if n<1000 then
         writeln((n-99)*3+189);
         else if n<1000 then
         writeln((n-999)*4+2889);

 close(input);
 close(output);
end.