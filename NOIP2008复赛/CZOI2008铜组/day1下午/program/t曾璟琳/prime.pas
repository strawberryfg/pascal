var n:integer;
    a:array[1..1000]of integer;
procedure print;
var i:integer;
begin;  for i:=1 to n-1 do
    write(a[i],' ');
  writeln(a[n]);
end;
function pd(dep:integer):boolean;
var i:integer;
begin
pd:=true;
for i:=1 to dep-1 do
  if a[i]=a[dep] then begin pd:=false;exit;end;
end;
function primt(m,n:integer):boolean;
var i,k:integer;
begin
primt:=true;
k:=m+n;
for i:=2 to trunc(sqrt(k)) do
  if k mod i=0 then begin primt:=false;exit;end;
end;
procedure try(dep:integer);
var i:integer;
begin
if (dep>n)and (primt(a[n],a[1])=true) then print
         else for i:=2 to n do
                 begin
                  a[dep]:=i;
                  if (pd(dep))and(primt(i,a[dep-1])) then try(dep+1);
                 end;
end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
readln(n);
if n mod 2=1 then begin writeln('');close(input);close(output);halt;end;
a[1]:=1;
try(2);
close(input);
close(output);
end.

