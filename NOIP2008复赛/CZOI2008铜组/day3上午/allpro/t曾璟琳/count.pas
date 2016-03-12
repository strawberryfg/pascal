var w,n,i,k:longint;
    a:array[0..9]of integer;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
readln(n);
for i:=1 to n do
  a[i]:=0;
k:=0;
for i:=1 to n do
 begin
   w:=i;
   while w<>0 do
    begin
     k:=w mod 10;
     inc(a[k]);
     w:=w div 10;
    end;
 end;
for i:=0 to 9 do
  writeln(a[i]);
close(input);
close(output);
end.