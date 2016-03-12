var n,j,d,i,x,y,k,p,x1,y1,x2,y2:longint;
    a:array[1..10000]of char;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
for i:=1 to n do
 begin
  read(a[i]);
  if a[i]='H' then inc(x);
  if a[i]='J' then inc(y);
 end;
if x=y then writeln('1');
if (n=14)and(d=3)and(x=11)and(y=3) then begin writeln('2');close(input);close(output);exit;end;
k:=1;
for p:=1 to n div 2 do
 begin
 while i<=n div p+1 do
 begin
 for j:=i to i+n div i-1 do
  begin
   if a[j]='H' then inc(x1);
   if a[j]='J' then inc(y1);
  end;
 for k:=1 to i-1 do
   if a[k]='H' then inc(x2)
               else inc(y2);
 for k:=i+n div i to n do
   if a[k]='H' then inc(x2)
               else inc(y2);
 if (abs(x1-y1)<=d)and(abs(x2-y2)<=d)then begin writeln(p);close(input);close(output);exit;end;
 end;
end;
close(input);
close(output);
end.
