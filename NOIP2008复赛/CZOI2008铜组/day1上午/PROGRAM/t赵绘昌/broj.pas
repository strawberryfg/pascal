var a,b,n,i,total,k:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
read(n);
total:=0;
k:=1;
while n<>0 do
    begin
    if n<10 then begin total:=total+n;break;end;
    a:=n div 10;
    b:=n mod 10;
    n:=n-k*9;
    k:=k*10;
    total:=total+a*10+b;
    end;
writeln(total);
close(input);
close(output);
end.

