var s,t,n,i,j:longint; a:array [1..1000] of integer;
function pd:longint;
   var s,j,k:longint;
   begin
   pd:=0;
   for j:=1 to i-1 do
   if a[j]>a[i] then pd:=pd+1;
   end;
function pd1:longint;
   var j:longint;
   begin
   pd1:=0;
   for j:=i+1 to n do
   if a[j]>a[i] then pd1:=pd1+1;
   end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i]);
    s:=0;

    for i:=2 to n-1 do
    if pd=pd1 then s:=s+1;
    t:=1;
for i:=2 to n do
if a[i]>a[1] then t:=0;
if t=1 then s:=s+1;
t:=0;
for i:=1 to n-1 do
if a[i]>a[n] then t:=1;
if t=0 then s:=s+1;
writeln(s);
close(input);
close(output);
end.