var n,i,s:longint;
    a:array[1..10000]of longint;
function check(f:longint):boolean;
var i:longint;
begin
check:=true;
if f=1 then check:=false;
if (f=2)or(f=3) then begin check:=true;exit;end
                       else for i:=2 to trunc(sqrt(f)) do
                                if f mod i=0 then begin check:=false;exit;end;

end;
begin
assign(input,'primenum.in');assign(output,'primenum.out');
reset(input);rewrite(output);
n:=0;
while not eof do
      begin
      inc(n);
      readln(a[n]);
      end;
s:=0;
for i:=1 to n do
    begin
    if check(a[i])=true then inc(s);
    end;
write(s);
close(input);close(output);
end.
