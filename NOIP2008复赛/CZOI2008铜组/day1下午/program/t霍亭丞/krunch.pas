var a:string;i:longint;
begin
assign(input,'krunch.in');assign(output,'krunch.out');
reset(input);rewrite(output);
readln(a);
if a[1]=' ' then delete(a,1,1);if a[length(a)]=' ' then delete(a,length(a),1);
for i:=1 to length(a) do
    if (a[i]=a[i+1]) then delete(a,i,1);
for i:=1 to length(a) do
    if (a[i]='A')or(a[i]='E')or(a[i]='I')or(a[i]='O')or(a[i]='U') then delete(a,i,1);
writeln(a);
close(input);close(output);
end.