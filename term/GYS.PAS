var a,b,c:longint;
begin
read(a,b);
if a mod b>0 then
begin
repeat
begin
c:=a;
a:=b;
b:=c mod a;
end;
until a mod b=0;
end;
writeln(b);
end.