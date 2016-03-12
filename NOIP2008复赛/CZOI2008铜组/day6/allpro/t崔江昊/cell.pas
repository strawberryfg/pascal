var n,m,i,s,j:longint; x:string;a:array[0..1000,0..1000] of longint;
begin

assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(m,n);
for i:=0 to m+1 do
   for j:=0 to n+1 do
   a[i,j]:=-1;
for i:=1 to m do
   begin
   x:='';
   readln(x);
   for j:=1 to length(x) do
   a[i,j]:=ord(x[j])-48;
   end;
for i:=1 to m+1 do
   for j:=1 to n+1 do
   begin
   if a[i-1,j]=-1 then a[i-1,j]:=a[i,j];
   if a[i+1,j]=-1 then a[i+1,j]:=a[i,j];
   if a[i,j+1]=-1 then a[i,j+1]:=a[i,j];
   if a[i,j-1]=-1 then a[i,j-1]:=a[i,j];
   end;
   s:=0;
for i:=1 to m do
   for j:=1 to n do
   if (a[i+1,j]=a[i,j]) and (a[i-1,j]=a[i,j]) and (a[i,j]=a[i,j+1]) and (a[i,j]=a[i,j-1])
   then  s:=s+1;
writeln(s);
close(input);
close(output);
end.
