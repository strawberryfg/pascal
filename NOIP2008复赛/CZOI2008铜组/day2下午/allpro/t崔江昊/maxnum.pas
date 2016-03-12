var x:array [1..10000] of integer;
i,j:longint;
a:array[1..1000] of longint;
procedure pd(n:longint);
   var i,s,j:longint;
   begin
   for i:=1 to trunc(sqrt(n)) do
   if n mod i=0 then begin
                     x[i]:=x[i]+1;
                     x[n div i]:=x[n div i]+1;
                       end;
   if n=i*i then x[i]:=x[i]-1;
   end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
i:=0;
while (not eoln) do
begin
i:=i+1;
readln(a[i]);
end;
for j:=1 to i do
   pd(a[j]);
for j:=2000 downto 1 do
   if x[j]=i then begin
   writeln(j);
   break;
   end;
close(input);
close(output);
end.
