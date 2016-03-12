var n,i,k:longint;
    a:array[0..9]of int64;
begin
assign(input,'count.in');
assign(output,'count.out');
reset(input);rewrite(output);
read(n);
for i:=1 to n do
    begin
    k:=i;
    while k>0 do
          begin
          inc(a[k mod 10]);
          k:=k div 10;
          end;
    end;
for i:=0 to 9 do
    writeln(a[i]);
close(input);
close(output);
end.