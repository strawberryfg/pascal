var n,m,i,j,max,res:longint;
    a,sum,f:array[0..1000000]of longint;
begin
assign(input,'ziduanhe.in');
reset(input);
assign(output,'e:\wqf\ziduanhe2.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
   begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
   end;
f[1]:=a[1];
res:=f[1];
for i:=2 to n do
    begin
    max:=-2147483647;
    for j:=1 to m do
        begin
        if i-j<=0 then continue;
        if sum[i]-sum[i-j]>max then max:=sum[i]-sum[i-j];
        if max=2299 then
           writeln('i:',i,' j:',j);
        end;
    f[i]:=max;
    if f[i]>res then res:=f[i];
    end;
writeln(res);
close(input);
close(output);
end.
