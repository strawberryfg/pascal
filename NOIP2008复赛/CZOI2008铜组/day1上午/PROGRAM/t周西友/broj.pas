var a:string;
    t,n,i:integer;
begin
 assign(input,'broj.in');
 reset(input);
 assign(output,'broj.out');
 rewrite(output);
 readln(n);
 a:='';
 i:=1;
 while i<=9 do
 begin
 a:=a+chr(i+48);
 inc(i);
 end;
 for i:=10 to n do
 begin
 t:=i div 10;
 a:=a+chr(t+48)+chr(i-10*t);
 end;
 writeln(length(a));
 close(input);
 close(output);
end.