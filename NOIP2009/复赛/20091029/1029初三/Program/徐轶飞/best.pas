var n,i,j,a,t,tt:longint;
begin
assign(input,'best.in');
assign(output,'best.out');
reset(input);
rewrite(output);
t:=1;
tt:=1;
readln(n);
for i:=2 to n-1 do
    begin
    tt:=1;
    a:=n mod i;
    for j:=1 to i-a do
        tt:=tt*(n div i);
    for j:=1 to a do
        tt:=tt*(n div i+1);
    if tt>t then t:=tt
            else break;
    end;
writeln(t);
close(input);
close(output);
end.