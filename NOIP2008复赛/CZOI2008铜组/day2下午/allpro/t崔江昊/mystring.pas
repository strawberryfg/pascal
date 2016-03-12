var a,max,min:string; b:array [1..100] of string; s,i:longint;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
readln(a);
s:=1;
for i:=1 to length(a) do
   begin
   if a[i]=' 'then s:=s+1
   else b[s]:=b[s]+a[i];
   end;
   max:=b[1];
   min:=b[1];
for i:=2 to s do
   begin
   if length(max)<length(b[i]) then max:=b[i];
   if length(min)> length(b[i]) then min:=b[i];
   end;
writeln(max);
writeln(min);
close(input);
close(output);
end.