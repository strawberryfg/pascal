var i,j,n,t,t1,t2,max:longint;
    f:array[0..1000,0..1000]of longint;
    a:array[1..1000]of longint;
begin
assign(input,'sequence.in');
reset(input);
assign(output,'sequence.out');
rewrite(output);
readln(n);
for i:=1 to n do
    read(a[i]);
for i:=1 to n do
    begin
    t:=a[i];
    for j:=1 to i do
        begin
        t1:=f[i-1,j];
        if j=t then t2:=f[i-1,j-1]+1
           else t2:=f[i-1,j-1];
        if t1>t2 then f[i,j]:=t1 else f[i,j]:=t2;
        if i=n then if f[i,j]>max then max:=f[i,j];
        end;
    end;
writeln(max);
close(input);
close(output);
end.