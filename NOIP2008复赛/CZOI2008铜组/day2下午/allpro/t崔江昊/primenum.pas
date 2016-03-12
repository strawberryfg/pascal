var i,s,j,k,t:longint; p:set of 1..5;  a:array[1..1000] of longint;
procedure pd(n:longint);
   var i,j:longint;
   begin
   if n=1 then exit;
   for i:=2 to trunc(sqrt(n)) do
      if n mod i=0 then exit;
      s:=s+1;
   end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
i:=0;
    while (not eoln) do
        begin
        i:=i+1;
        readln(a[i]);
        end;
        s:=0;
for j:=1 to i do
   pd(a[j]);
writeln(s);
close(input);
close(output);
end.