var n,i,j,x,y,t:longint;a:array[1..18,1..18]of longint;
begin
assign(input,'spring.in');
assign(output,'spring.out');
readln(n);
for i:=1 to n do
    for j:=1 to n do
        begin
        read(a[i,j]);
        end;
x:=n div 2;
while x<n  do
      begin
      inc(x);
      inc(y);
      t:=t+a[x,y]
      end;
writeln(t);
close(input);
close(output);
end.