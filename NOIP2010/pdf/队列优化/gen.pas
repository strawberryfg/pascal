var n,m,i,t1,t2:longint;
begin
assign(output,'ziduanhe.in');
rewrite(output);
readln(n,m);
randomize;
writeln(n,' ',m);
for i:=1 to n do
    begin
    t1:=random(2);
    t2:=random(100);
    if t1=0 then write('-',t2,' ') else write(t2,' ');
    end;
close(output);
end.