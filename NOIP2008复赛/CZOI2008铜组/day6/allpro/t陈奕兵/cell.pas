var total,i,j,k,x,y:longint;
    n:array[0..61]of string;
    a,b,c:string;
begin
assign(input,'cell.in');
assign(output,'cell.out');
reset(input);
rewrite(output);
readln(i,j);
for x:=1 to i do
    readln(n[x]);
for x:=1 to i do
   begin
   a:=n[x];b:=n[x+1];c:=n[x-1];
   for y:=2 to j-1 do
   if ((ord(b[y])-48)>0)and((ord(c[y]))-48>0)and((ord(a[y-1])-48)>0)and((ord(a[y+1]))-48>0)
                                         then inc(total);
   if (and((ord(b[y])-48)>0)and((ord(c[y]))-48>0)and((ord(a[y-1])-48)>0) then inc(total)
                                              else
   if ((ord(b[y])-48)>0)and((ord(c[y]))-48>0)and((ord(a[y+1]))-48>0) then inc(total)
                                              else
   if ((ord(b[y])-48)>0)and((ord(a[y-1]))-48>0)and((ord(a[y+1]))-48>0) then inc(total)
                                              else
   if ((ord(c[y])-48)>0)and((ord(a[y-1]))-48>0)and((ord(a[y+1]))-48>0) then inc(total);
   end;
writeln(total-5);
close(input);
close(output);
end.
