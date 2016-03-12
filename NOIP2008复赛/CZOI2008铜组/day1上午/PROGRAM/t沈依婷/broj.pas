var n,j,i,k,v,total:integer;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
v:=n;
while v<>0 do
begin
v:=v div 10;
inc(k);
end;
if k=1 then begin writeln(n);close(input);close(output);halt;end;
k:=k-1;
v:=1;
for i:=1 to k do v:=v*10;
total:=total+(n-v)*(k+1)+9;
v:=1;
for i:=2 to k do
begin
for j:=1 to i-1 do
v:=v*10;
total:=total+(i-1)*v*9*i;
v:=1;
end;
total:=total+k+1;
writeln(total);
close(input);
close(output);
end.
