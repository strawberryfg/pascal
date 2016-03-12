var a,b,c:array[0..1000]of longint;
    n,i,j,total:longint;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
read(n);
for i:=1 to n do
    read(a[i]);
i:=1;
a[0]:=maxlongint;
c[1]:=0;
c[0]:=-1;
while i<n do
   begin
   inc(i);
   j:=i-1;
   while a[i]>a[j] do dec(j);
   c[i]:=c[j]+c[i]+1
   end;
i:=n;
a[n+1]:=maxlongint;
b[n]:=0;
b[n+1]:=-1;
while i>1 do
   begin
   dec(i);
   j:=i+1;
   while a[i]>a[j] do inc(j);
   b[i]:=b[j]+b[i]+1;
   end;
for i:=1 to n do
    if b[i]=c[i] then inc(total);
writeln(total);
close(input);
close(output);
end.