var x1,y1,x2,y2,x3,y3:longint;
function compute(u,v,w,t:longint):extended;
begin
exit(sqrt((w-u)*(w-u)+(t-v)*(t-v)));
end;
function calc:extended;
var a,b,c,mid,ans:extended;
begin
a:=compute(x1,y1,x2,y2);
b:=compute(x1,y1,x3,y3);
c:=compute(x2,y2,x3,y3);
mid:=(a+b+c)/2;
ans:=mid*(mid-a)*(mid-b)*(mid-c);
exit(sqrt(ans));
end;
begin
readln(x1,y1);
readln(x2,y2);
readln(x3,y3);
writeln(calc:0:20);
end.