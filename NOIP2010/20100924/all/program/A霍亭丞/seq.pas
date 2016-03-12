var t,n,i,min,max:longint;a:array[1..100000]of longint;
begin
assign(input,'seq.in');
assign(output,'seq.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a[i]);
    end;
min:=a[1];
max:=a[1]*2-(a[1]*2-a[2]);
for i:=2 to n-1 do
    begin
    if (a[i]*2-a[i+1])>min then min:=a[i]*2-a[i+1];
    if a[i]<max then max:=a[i];
    t:=a[i]*2-min;
    min:=a[i]*2-max;
    max:=t;
    end;
if a[n]<min then min:=a[n];
if max>=min then writeln(max-min+1) else writeln('0');
close(input);
close(output);
end.
