var n,k,i,j,t:longint;
        a:array[1..10000] of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
        read(a[i]);
for i:=1 to n-1 do
        for j:=i+1 to n do
                if a[j]>a[i] then begin t:=a[j];a[j]:=a[i];a[i]:=t; end;
writeln(a[k]);
close(input);
close(output);
end.