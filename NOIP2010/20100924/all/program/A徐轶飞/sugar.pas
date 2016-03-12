var n,i:longint;
    a1,a2:int64;
begin
assign(input,'sugar.in');
assign(output,'sugar.out');
reset(input);
rewrite(output);
readln(n);
a1:=3;
for i:=2 to n do
    begin
    a2:=a1+i+1;
    a1:=a2;
    a2:=0;
    end;
writeln(a1);
close(input);
close(output);
end.