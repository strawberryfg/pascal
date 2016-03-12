var p,t,k,j,i,s:longint;
   a:array[1..1000] of longint;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
t:=10000;
while not eof do
begin
inc(k);
readln(a[k]);
if a[k]=1 then begin write('1');close(input);close(output);exit;end;
if a[k]<t then t:=a[k];
end;
s:=0;
for i:=2 to t do
   begin
   p:=0;
   for j:=1 to  k do
   if a[j] mod i<>0 then begin p:=1;break;end;
   if p=0 then s:=i;
   end;
   if s=0 then s:=1;
write(s);
close(input);
close(output);
end.
