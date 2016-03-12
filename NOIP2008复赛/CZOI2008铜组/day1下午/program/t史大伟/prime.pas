var   n:longint;
  a:array[1..17] of longint;
  s:set of 1..33;
procedure print;
var i:longint;
begin
if not((a[n]+a[1]) in s) then exit;
for i:=1 to n-1 do
    write(a[i],' ');
    write(a[n]);
writeln;
end;
function pd(i:longint):boolean;
var j:longint;
begin
pd:=true;
for j:=1 to i-1 do
if  a[i]=a[j] then begin pd:=false;break;end;
if not ((a[i]+a[i-1]) in s) then pd:=false;
end;
procedure try(dep:longint);
var i:longint;
begin
if dep>n then print
         else for i:=1 to n do
               begin
               if (dep mod 2=1)and(i mod 2=1)or(dep mod 2=0)and(i mod 2=0) then
               begin
               a[dep]:=i;
               if pd(dep) then try(dep+1);
               end;
               end;
end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
read(n);
if n mod 2=1 then exit;
s:=[2,3,5,7,11,13,17,19,23,29,31];
a[1]:=1;
try(2);
close(input);
close(output);
end.