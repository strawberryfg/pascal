var a:array[1..16] of longint;
    n:longint;
procedure print;
var i:longint;
begin
for i:=1 to n-1 do
    write(a[i],' ');
writeln(a[n]);
end;
function check(n:longint):boolean;
var i:longint;
begin
check:=true;
for i:=1 to n-1 do
    if a[i]=a[n] then check:=false;
end;
function prime(n:longint):boolean;
var i:longint;
begin
prime:=true;
for i:=2 to trunc(sqrt(n)) do
    if n mod i =0 then begin prime:=false;exit;end;
end;
procedure try(dep:longint);
var i:longint;
begin
if dep>n then begin if prime(a[n]+1) then print;end
         else for i:=1 to n do
              begin
              a[dep]:=i;
              if (check(dep))and(prime(a[dep-1]+a[dep])) then try(dep+1);
              end;
end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
readln(n);
if odd(n) then halt;
a[1]:=1;
try(2);
close(input);
close(output);
end.