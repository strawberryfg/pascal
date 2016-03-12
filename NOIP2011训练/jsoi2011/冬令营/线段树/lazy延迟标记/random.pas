var n,m,i,t,p,k:longint;
begin
assign(output,'modify.in');
rewrite(output);
readln(n,m);
randomize;
writeln(n,' ',m);
for i:=1 to n do
    begin
    t:=random(10000)+1;
    write(t,' ');
    end;
for i:=1 to m do
    begin
    t:=random(n-2)+1;
    p:=random(n-2)+1;
    while t>p do p:=random(n-2)+1;
    k:=random(100);
    writeln(t,' ',p,' ',k);
    end;
close(output);
end.