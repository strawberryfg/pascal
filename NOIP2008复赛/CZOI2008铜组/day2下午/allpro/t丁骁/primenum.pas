var n,i,num:longint;
    a:array[1..1000] of longint;
function pr(p:longint):boolean;
var k:longint;
begin
pr:=true;
if p=1 then pr:=false
       else for k:=2 to trunc(sqrt(p)) do
                if p mod k=0 then begin
                                  pr:=false;
                                  break;
                                  end;
end;
begin
assign(input,'primenum.in');
assign(output,'primenum.out');
reset(input);
rewrite(output);
n:=0;
while not eof do
      begin
      inc(n);
      readln(a[n]);
      end;
for i:=1 to n do
    if pr(a[i]) then inc(num);
writeln(num);
close(input);
close(output);
end.
