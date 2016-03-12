var x1,x2,x3,y1,y2,y3:longint;
function calc:extended;
var a,b,c,d:longint;
begin
a:=x3-x1;
b:=y2-y1;
c:=x2-x1;
d:=y3-y1;
exit(abs(a*b-c*d)*0.5);
end;
begin
readln(x1,y1);
readln(x2,y2);
readln(x3,y3);
writeln(calc:0:20);
end.