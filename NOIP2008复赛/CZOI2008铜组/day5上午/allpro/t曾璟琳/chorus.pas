var n,i,max,t,s:longint;
    a:array[1..1000]of longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
for i:=1 to n-1 do
  read(a[i]);
readln(a[n]);
max:=0;
for i:=1 to n do
  if a[i]>max then begin max:=a[i];t:=i;end;
for i:=1 to t-1 do
  if (a[i]>=a[i+1])or(a[i]>=a[i+2])and ((i+2)<=t) then inc(s);
for i:=n downto t+1 do
   if (a[i]>=a[i-1])or(a[i]>=a[i-2]) and ((i-2)<=t)  then inc(s);
writeln(s);
close(input);
close(output);
end.
