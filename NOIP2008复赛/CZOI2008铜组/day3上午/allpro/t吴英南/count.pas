var m,i,n:longint;
    a:array[0..10]of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
while i<>n do
      begin
      inc(i);
      m:=i;
      while m <>0 do
            begin
            inc(a[m mod 10]);
            m:=m div 10;
            end;
      end;
for i:=0 to 9 do
    writeln(a[i]);
close(input);
close(output);
end.