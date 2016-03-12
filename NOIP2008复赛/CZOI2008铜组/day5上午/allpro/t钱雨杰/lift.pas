var a,b,n,i,t,number:longint;
    c:array[1..100]of longint;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
for i:=1 to n do
    read(c[i]);
t:=a;
while t<>b do
   begin
   if t+c[t]<=n then t:=t+c[t]
                else t:=t-c[t];
   inc(number);
   end;
writeln(number);
close(input);
close(output);
end.