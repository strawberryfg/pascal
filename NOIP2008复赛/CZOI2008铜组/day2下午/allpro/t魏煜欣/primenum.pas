var i,j,s:longint;
    a:array[1..1000]of longint;
function pd(n:longint):boolean;
var i:longint;
begin
if a[n]=1 then begin
               pd:=false;
               exit;
               end;
pd:=true;
if a[n]=2 then begin
               pd:=true;
               exit;
               end;
i:=2;
while true do
        begin
        if a[n] mod i = 0 then begin
                               pd:=false;
                               exit;
                               end;
        if i*i>a[n] then exit;
        inc(i);
        end;
end;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
while not eof do
                begin
                inc(i);
                read(a[i]);
                readln;
                end;
for j:=1 to i do
if pd(j) then inc(s);
writeln(s);
close(input);
close(output);
end.
