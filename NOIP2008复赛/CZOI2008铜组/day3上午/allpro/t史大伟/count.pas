var  n,i,t:longint;
     a:array[0..9] of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
read(n);
for i:=1 to n do
    begin
    t:=i;
    while t>0 do
          begin
          inc(a[t mod 10]);
          t:=t div 10;
          end;
    end;
for i:=0 to 9 do
writeln(a[i]);
close(input);
close(output);
end.