var t,n,i,j,s,x,y,f:integer;
    a:array[1..1000,1..2]of longint;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do
 begin
 for j:=1 to 2 do
  read(a[i,j]);
 readln;
 end;
for i:=1 to n-1 do
 begin
 f:=0;
 for j:=i+1 to n do
   if (a[j,1]<=a[i,2])and (a[j,1]>=a[i,1])then
     begin
       f:=-1;
       x:=a[i,2]-a[i,1]+1;
       y:=a[j,2]-a[j,1]+1;
       if x<y then begin s:=s+y;a[j,1]:=-1;a[j,2]:=-1;t:=-1;end
              else if t=0 then begin s:=s+x;a[i,1]:=-1;a[i,2]:=-1;a[j,1]:=-1;a[j,2]:=-1;end
                          else  begin a[j,1]:=-1;a[j,2]:=-1;end;
     end;
   if f=-1 then  begin a[i,1]:=-1;a[i,2]:=-1;end;
 end;
for i:=1 to n do
 if a[i,1]<>-1 then s:=s+a[i,2]-a[i,1]+1;
writeln(s);
close(input);
close(output);
end.