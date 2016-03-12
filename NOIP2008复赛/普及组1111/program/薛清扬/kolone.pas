var n1,n2,n,i,j,t,f:longint;
a,b,c:array[-50..10000]of char;
pd:boolean;
procedure try2;
var y:char;
begin
if i=f then if c[1]=b[1] then begin if pd=true then pd:=false else pd:=true; inc(f);end;
if i=n then begin if c[i]<>a[n1] then begin
if i mod 2=0 then
begin
y:=c[i+1];
c[i+1]:=c[i];
c[i]:=y;
exit;
end;
end
else dec(n);
end
else begin
if i mod 2=0 then
begin
y:=c[i+1];
c[i+1]:=c[i];
c[i]:=y
end;
end;
end;
procedure try1;
var y:char;
begin
if i=f then if c[1]=b[1] then begin if pd=true then pd:=false else pd:=true; inc(f);end;
if i=n then
begin
if c[i]<>a[n1] then
begin
if i mod 2=1 then
begin
y:=c[i+1];
c[i+1]:=c[i];
c[i]:=y;
exit;
end
end else dec(n);
end else begin
if i mod 2=1 then
begin
y:=c[i+1];
c[i+1]:=c[i];
c[i]:=y
end;
end;
end;
procedure change(x:longint);
var y:char;
j,n:longint;
begin
if x=1 then
begin
y:=c[n1];
c[n1]:=c[n1+1];
c[n1+1]:=y;
exit;
end
else
begin
if x mod 2=1 then n:=x+1
else n:=x;
for i:=n1-n div 2 to n1+n div 2 do
begin
if n=x+1 then if pd=true then try1 else try2
         else if pd=true then try2 else try1;
end;
end;
end;
begin
assign(input,'kolone.in');
assign(output,'kolone.out');
reset(input);
rewrite(output);
readln(n1,n2);
n:=n1+n2;
f:=1;
for j:=n1 downto 1 do
read(a[j]);
readln;
for j:=1 to n2 do
read(b[j]);
readln;
readln(t);
if t=0 then begin for i:=1 to n1 do write(a[i]);for i:=1 to n2 do write(b[i]);close(input);close(output);halt;end;
for i:=1 to n1 do
c[i]:=a[i];
for i:=1 to n2 do
c[i+n1]:=b[i];
if n1 mod 2 =1 then pd:=true
else pd:=false;
for j:=1 to t do
change(j);
for i:=1 to n1+n2 do
write(c[i]);
close(input);
close(output);
end.
