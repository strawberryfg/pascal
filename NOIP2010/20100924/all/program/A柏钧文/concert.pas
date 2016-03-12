var sum,i,n:longint;
        a,b:array[1..1000]of longint;
begin
assign(input,'concert.in');
reset(input);
assign(output,'concert.out');
rewrite(output);
readln(n);
sum:=0;
for i:=1 to n do
        readln(a[i]);
for i:=1 to n do
        readln(b[i]);
for i:=1 to n do
        sum:=sum+a[i]*b[i];
writeln(sum);
close(input);
close(output);
end.