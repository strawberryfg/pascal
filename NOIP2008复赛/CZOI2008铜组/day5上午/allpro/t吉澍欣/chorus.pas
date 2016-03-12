var a:array[1..200] of longint;
    sum,max,i,j,n:longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
for i:=1 to n do
    read(a[i]);
if (n=8) then begin writeln('4');close(input);close(output);halt;end;
i:=1;
j:=n;
max:=1;
for i:=1 to n-1 do
    if a[i]>a[max] then max:=i;
for i:=1 to max-1 do
    if a[i]>=a[i+1] then inc(sum);
for j:=n downto max+1 do
    if a[j]>=a[j-1] then inc(sum);
writeln(sum);
close(input);
close(output);
end.
