var n,i,j,x,max,maxn:longint;
 a:array[1..100,1..100] of longint;
 b:array[1..100] of longint;
begin
assign(input,'tree.in');
reset(input);
assign(output,'tree.out');
rewrite(output);
readln(n);
for i:=1 to n do
   begin
   read(b[i]);
   while not eoln do
      begin
      read(x);
      a[i,x]:=1;
      end;
   end;
maxn:=0;
for i:=n downto 1 do
   begin
   max:=0;
   for j:=i to n do
   if (a[i,j]=1) and (b[j]>max) then max:=b[j];
   b[i]:=b[i]+max;
   if b[i]>maxn then maxn:=b[i];
   end;
writeln(maxn);
close(input);
close(output);
end.