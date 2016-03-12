program ex2;
var n,t,i,j,s:longint;
    a:array[0..10]of longint;
begin
assign(input,'broj.in');reset(input);
assign(output,'broj.out');rewrite(output);
readln(n);
t:=1;i:=0;
while t*10<n do
        begin
        inc(i);
        a[i]:=t*10-t;
        t:=t*10;
        end;
a[i+1]:=n-t+1;
for j:=1 to i+1 do
    s:=s+a[j]*j;
writeln(s);
close(input);
close(output);
end.