var a,b,c,i,n:longint;
    s:real;
begin
read(n);
a:=1;
b:=1;
s:=1;
for i:=1 to n-1 do
    begin
    c:=a;
    a:=b;
    b:=c+a;
    s:=s+a/b;
    end;
writeln(s:0:4);
end.