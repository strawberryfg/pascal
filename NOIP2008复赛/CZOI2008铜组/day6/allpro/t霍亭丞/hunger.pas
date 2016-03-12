var n,a,b,s,i:longint;
begin
assign(input,'hunger.in');
assign(output,'hunger.out');
reset(input);rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a,b);
    s:=s+(a+b)div 2;
    end;
writeln(s div n);
close(input);close(output);
end.