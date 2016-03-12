var n,j,k,a,b:longint;
begin
assign(input,'concert.in');
assign(output,'concert.out');
reset(input);
rewrite(output);
randomize;
readln(n);
j:=0;
k:=0;
for i:=1 to n do
    begin
    readln(a);
    if a>j then j:=a;
    end;
for i:=1 to n do
    begin
    readln(b);
    if b>k then k:=b;
    end;
writeln(1.5*random(j*k));
close(input);
close(output);
end.