var i,n,x,y,min,x1:longint;
    a:array[1..200,1..2] of longint;
    b:array[1..200] of longint;
procedure try(dep,count:longint);
var i:longint;
begin
if count>1000 then begin min:=-1;exit;end;
if dep=y then
         begin
         if count<min then min:=count;
         end
         else for i:=1 to b[dep] do
                  try(a[dep,i],count+1);
end;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
read(n,x,y);
for i:=1 to n do
    begin
    read(x1);
    b[i]:=0;
    if x1+i<=n then begin inc(b[i]);a[i,b[i]]:=x1+i;end;
    if i-x1>=1 then begin inc(b[i]);a[i,b[i]]:=i-x1;end;
    end;
min:=maxlongint;
try(x,0);
writeln(min);
close(input);
close(output);
end.
