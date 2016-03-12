var i,j,t,n,k:integer;
    a:array[1..10000]of integer;
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
    if a[i]<a[j] then begin t:=a[i];a[i]:=a[j];a[j]:=t;end;
for i:=1 to n do
  if a[i]=a[i+1] then for j:=i to n do
                        begin
                             a[j]:=a[j+1];
                             a[n]:=0;
                             n:=n-1;
                        end;
writeln(a[k]);
close(input);
close(output);
end.
