var i,n,k,j,t:longint;
    a:array[1..66000]of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
    readln(a[i]);
for i:=1 to n-1 do
    for j:=i+1 to n do
        begin
        if a[j]>a[i] then begin t:=a[j];a[j]:=a[i];a[i]:=t;end;
        end;
for i:=2 to n do
    if a[i]=a[i-1] then for j:=i to n-1 do
                            a[j]:=a[j+1];
writeln(a[k]);
close(input);
close(output);
end.
