var i,a,b:longint;
function find(m,n:longint):longint;
var r:longint;
begin
repeat
  r:=m mod n;
  m:=n;
  n:=r;
until r=0;
find:=m;
end;
begin
assign(input,'maxnum.in');
assign(output,'maxnum.out');
reset(input);rewrite(output);
readln(a);
i:=1;
while not eof do begin
    inc(i);
    readln(b);
    a:=find(a,b);
    end;
writeln(a);
close(input);
close(output);
end.