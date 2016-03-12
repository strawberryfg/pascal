var i,total:longint;s:array[1..10000]of longint;
function try(a:longint):boolean;
var i:longint;
begin
try:=true;
for i:=2  to trunc(sqrt(a)) do
    if (a mod i=0)and(a<>2) then begin try:=false;exit;end;
end;
begin
assign(input,'primenum.in');
assign(output,'primenum.out');
reset(input);rewrite(output);
while not eof do
    begin
    inc(i);
    read(s[i]);
    if (try(s[i])=true)and(s[i]<>1)and(s[i]<>0) then inc(total);
    end;
writeln(total);
close(input);
close(output);
end.
