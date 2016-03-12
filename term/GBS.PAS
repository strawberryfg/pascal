var a,b,c,i:longint;
begin
read(a,b);
if a<b then begin c:=a; a:=b; b:=c; end;
c:=a;
if c mod b>0 then
begin
repeat
c:=c+a;
until c mod b=0;
end;
writeln(c);
end.