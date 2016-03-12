var n,i,t,t2,l:longint;
    sum:int64;
function len(n:longint):longint;
var s:longint;
begin
s:=1;
while n div 10 >0 do
begin
inc(s);
n:=n div 10;
end;
len:=s;
end;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
if n<10 then begin writeln(n);close(input);close(output);halt;end;
l:=len(n);
t:=trunc(exp(ln(10)*(l-1)));
t2:=n-t;
sum:=sum+(t2+1)*l;
for i:=0 to l-2 do
    sum:=sum+trunc(exp(ln(10)*i))*9*(i+1);
writeln(sum);
close(input);
close(output);
end.
