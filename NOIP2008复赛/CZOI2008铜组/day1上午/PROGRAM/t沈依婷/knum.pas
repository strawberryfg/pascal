var a:array[1..1000000000]of integer;i,j,n,t,k:integer;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
read(n,k);
for i:=1 to n do read(a[i]);
for i:=1 to n-1 do
        for j:=i+1 to n do
        if a[i]<a[j] then begin t:=a[i];a[i]:=a[j];a[j]:=t;end;
writeln(a[k]);
close(input);
close(output);
end.
