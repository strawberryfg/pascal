var n,k,i,t,tot:longint;
    a:array[1..30]of integer;
procedure try(dep:longint);
var i:longint;
begin
if dep=n then inc(tot)
   else for i:=1 to 3 do
            begin
            if (dep+i<=n)and(a[dep+i]<>1) then try(dep+i);
            end;
end;
begin
assign(input,'stair.in');
reset(input);
assign(output,'stair.out');
rewrite(output);
readln(n);
readln(k);
for i:=1 to k do
    begin
    readln(t);
    a[t]:=1;
    end;
try(0);
writeln(tot);
close(input);
close(output);
end.