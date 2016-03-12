var a:array[1..32767]of integer;
    k,n,max,i,j,t:integer;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);

read(n,k);
for i:=1 to n do
 readln(a[i]);
for i:=1 to n-1 do
 for j:=i+1 to n do
  if a[j]>a[i] then
   begin
     t:=a[i]; a[i]:=a[j]; a[j]:=t;
   end;
for i:=1 to n do writeln(a[i]:3);
writeln(a[k]);

close(input);
close(output);
end.
