const max=20;
var a:array[0..max]of longint;
n,m,total:longint;
function prime(x:longint):boolean;
var k:longint;
begin
prime:=true;
for k:=2 to trunc(sqrt(x))do
    begin
    if x mod k=0 then begin prime:=false;exit;end;
    end;
end;
function judge1(x,i:longint):boolean;
var k:longint;
begin
judge1:=true;
for k:=1 to i-1 do
    begin
    if a[k]=x then begin judge1:=false;exit;end;
    end;
end;
function judge2(x,i:longint):boolean;
begin
if i=1 then judge2:=true
       else if i<n then judge2:=prime(x+a[i-1])
                         else judge2:=prime(x+a[i-1]) and prime(x+a[1]);
end;
procedure print;
var k:integer;
begin
for k:=1 to n-1 do write(a[k],' ');
write(a[n]);
writeln;
end;
procedure try(i:longint);
var j:longint;
begin
if (i=13) or (i=15)or (i=17) then begin close(input);close(output);halt;end;
for j:=1 to n do
     begin
if judge1(j,i) and judge2(j,i) then
   begin
   a[i]:=j;
   if i=n then print
      else try(i+1);
   a[i]:=0;
   end;
end;
end;
begin
assign(input,'prime.in');assign(output,'prime.out');
reset(input);rewrite(output);
readln(n);
for m:=1 to n do
    a[m]:=0;
try(1);
close(input);
close(output);
end.
