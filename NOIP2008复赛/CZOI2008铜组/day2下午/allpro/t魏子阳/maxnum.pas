var n,i,j,max1,max2:longint;
    a:array[1..10000]of longint;
begin
assign(input,'maxnum.in');assign(output,'maxnum.out');
reset(input);rewrite(output);
n:=0;
while not eof do
      begin
      inc(n);
      readln(a[n]);
      end;
max1:=0;
for i:=1 to n do
    begin
    if a[i]>max1 then max1:=a[i];
    end;
max2:=0;
for i:=1 to max1 do
    begin
    j:=1;
    while j<=n do
          begin
          if a[j] mod i<>0 then break;
          inc(j);
          end;
    if  j=n+1 then max2:=i;
    end;
write(max2);
close(input);close(output);
end.
