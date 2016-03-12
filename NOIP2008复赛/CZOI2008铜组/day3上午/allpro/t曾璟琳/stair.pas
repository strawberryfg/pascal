var i,n,l,j,w,i1,k,s,f:longint;
    a:array[1..10000]of longint;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(k);
for i:=1 to k do
  readln(a[i]);
w:=0;
i:=1;
s:=0;
while i<=3 do
  begin
   i1:=i;
   w:=i1;
   f:=0;
   for j:=1 to k do
     if a[j]=i1 then begin inc(i);i1:=i;w:=i1;continue;end;
   while (i1<=3)and(f=0) do
   begin
    f:=-1;
    for j:=1 to  k do
     if (w+i1)=a[j] then begin i1:=i1+1;f:=0;end;
    if f=-1then break;
   end;
   if w=n then inc(s);
   w:=w+i1;
   if (w=n) then inc(s);
   for l:=1 to i1-1 do
     if (w+l=n) then inc(s);
   inc(i);
  end;
writeln(s);
close(input);
close(output);
end.
