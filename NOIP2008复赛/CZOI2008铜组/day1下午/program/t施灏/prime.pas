var a:array[0..100]of longint;
    m,n:longint;

function prime(x:integer):boolean;
var k:longint;
begin
prime:=true;
for k:=2 to trunc(sqrt(x))do
if x mod k=0 then begin prime:=false;exit;end;
end;

function la(x,i:longint):boolean;
var k:longint;
begin
la:=true;
for k:=1 to i-1 do
if a[k]=x then begin la:=false;exit;end;
end;

function lb(x,i:longint):boolean;
begin
if i=1 then lb:=true
       else if i<n then lb:=prime(x+a[i-1])
                   else lb:=prime(x+a[i-1]) and prime(x+a[1]);
end;

procedure print;
var i:longint;
begin
for i:=1 to n do write(a[i],' ');
writeln;
end;

procedure try(dep:longint);
var k:longint;
begin
for k:=1 to n do
begin
if la(k,dep) and lb(k,dep) then
begin
a[dep]:=k;
if dep=n then print
         else try(dep+1);
a[dep]:=0;
end;
end;
end;
begin

{assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output); }
readln(n);
for m:=1 to n do
    a[m]:=0;
try(1);
close(input);
close(output);
end.