var total,n,k,i,t:longint;a:array[1..100]of longint;
begin
assign(input,'panda.in');
assign(output,'panda.out');
reset(input);
rewrite(output);
readln(n,k);
for i:=1 to n do
    read(a[i]);
t:=0;
total:=1;
while (k>0)and(t<n) do
      begin
      inc(t);
      k:=k div 2-1;
      total:=total*a[t];
      for i:=2 to k do
          total:=total*a[t];
      end;
writeln(total);
close(input);
close(output);
end.