var n,k,total,i:longint;kk:array[1..40]of longint;
procedure try(a:longint);
var s:longint;
begin
for s:=1 to k do
    if (a=kk[s])or(a>n) then exit;
if a=n then begin inc(total);exit;end;
for s:=1 to 3 do
    try(a+s);
end;
begin
assign(input,'stair.in');
assign(output,'stair.out');
reset(input);rewrite(output);
readln(n);
readln(k);
for i:=1 to k do
    readln(kk[i]);
try(0);
writeln(total);
close(input);close(output);
end.
