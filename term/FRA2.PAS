var i,n:longint;
    s:real;
begin
read(n);
for i:=1 to n do
    begin
    if i mod 2=0 then
     s:=s-1/i
    else
     s:=s+1/i;
    end;
writeln(s:0:4);
end.