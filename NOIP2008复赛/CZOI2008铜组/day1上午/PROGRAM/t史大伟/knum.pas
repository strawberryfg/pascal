var  m,n,i,s,t,x:longint;
     a:array[-32768..32767] of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
read(m,n);
for i:=1 to m do
    begin
    readln(x);
    IF x>t then t:=x;
    inc(a[x]);
    end;
    while s<n do
    begin
    s:=s+a[t];
    t:=t-1;
    end;
    writeln(t+1);
close(input);
close(output);
end.
