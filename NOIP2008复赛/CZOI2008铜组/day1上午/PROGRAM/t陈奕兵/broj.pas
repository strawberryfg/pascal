var i,j,n,k,total:longint;
begin
assign(input,'broj.in');
assign(output,'broj.out');
reset(input);
rewrite(output);
readln(n);
if n<10 then writeln(n);
total:=9;
for i:=10 to n do
begin
if i<100 then total:=total+2;
if (i>=100)and(i<1000) then total:=total+3;
if (i>=1000)and(i<10000) then total:=total+4;
if (i>=10000)and(i<100000) then total:=total+5;
if (i>=100000)and(i<1000000) then total:=total+6;
if (i>=1000000)and(i<10000000) then total:=total+7;
if (i>=10000000)and(i<100000000) then total:=total+8;
if i=100000000 then total:=total+9;
end;
writeln(total);
close(input);
close(output);
end.