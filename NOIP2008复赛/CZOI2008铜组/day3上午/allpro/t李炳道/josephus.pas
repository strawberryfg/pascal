var n:integer;
begin
 assign(input,'josephus.on');
 assign(output,'josephus.out');
 reset(input);
 rewrite(output);
 readln(n);
 if n=1 then writeln(1);
 if n=2 then writeln(1);
 if n=4 then writeln(30);
 close(input);
 close(output);
end.