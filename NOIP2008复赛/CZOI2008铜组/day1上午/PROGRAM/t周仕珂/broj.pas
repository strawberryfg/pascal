var n,t:int64;
    s,j,i,p,total:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
t:=n;
s:=0;
while t<>0 do
        begin t:=t div 10; inc(s); end;
t:=n;
p:=1;
for j:=s downto 1 do
        for i:=1 to j-1 do
                begin
                p:=p*10;
                total:=total+(t-p+1)*s;
                t:=t div 10
                end;
if t div 10=0 then total:=total+9;
writeln(total);
close(input);
close(output);
end.