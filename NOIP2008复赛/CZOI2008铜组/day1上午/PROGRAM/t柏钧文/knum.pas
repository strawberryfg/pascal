var  n,k,i,j,m:longint;
     a:array[1..10000]of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
    readln(a[i]);
for i:=1 to n do
    begin
    m:=0;
    for j:=1 to n do
        begin
        if j=i then continue;
        if a[j]>a[i] then inc(m);
        end;
    if m=k-1 then begin writeln(a[i]);close(input);close(output);halt;end;
    end;
close(input);
close(output);
end.
