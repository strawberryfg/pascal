var a,b,c,i,j,n,m:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
a:=0;
for i:=1 to n do
begin
if i<10 then a:=a+1
else if i<100 then a:=a+2
else if i<1000 then a:=a+3
else if i<10000 then a:=a+4
else if i<100000 then a:=a+5
else if i<1000000 then a:=a+6
else if i<10000000 then a:=a+7
else if i<100000000 then a:=a+8
end;
writeln(a);
close(input);
close(output);
end.
