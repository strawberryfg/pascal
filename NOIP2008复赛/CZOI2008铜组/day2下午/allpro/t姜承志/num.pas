var high:packed array[1..1000]of integer;
    i,i2,total,n,l:integer;
begin
assign(input,'num.in');
assign(output,'num.out');
reset(input);
read(n);
for i:=1 to n do
    read(high[i]);
close(input);
for i:=1 to n do
    begin
    l:=0;
    for i2:=1 to i-1 do
        if high[i2]>i then inc(l);
    for i2:=i+1 to n do
        if high[i2]>i then dec(l);
    if l=0 then inc(total);
    end;
rewrite(output);
writeln(total);
close(output);
end.
