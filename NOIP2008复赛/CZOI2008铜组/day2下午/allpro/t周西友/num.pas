program ex;
var  a:array[1..1000] of integer;
     t,te,n,i,j,total:longint;
begin
 assign(input,'num.in');
 reset(input);
 assign(output,'num.out');
 rewrite(output);
 readln(n);
 for i:=1 to n do readln(a[i]);
 total:=total+1;
 for i :=1 to n do
 begin
  t:=0;
  te:=0;
  for j:=1 to i do if a[j]>a[i] then t:=t+1;
  for j:=i+1 to n do if a[j]>a[i] then te:=te+1;
  if t=te then total:=total+1;
 end;
  writeln(total);
 close(input);
 close(output);
end.
