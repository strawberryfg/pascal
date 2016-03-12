var a,b,c,d,m,n,i,j:longint;
v:array[1..26] of longint;
s:string;
function lala(a:longint):longint;
var i,j:longint;
begin
j:=1;
for i:=1 to a do 
j:=j*2;
lala:=j;
end;
function ok(a:longint):longint;
var b,c,d,i:longint;
begin
b:=ord(s[1])-ord('A')-1;
for i:=1 to b do
c:=c+lala(n+1-i);
ok:=c;
end;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(s);
c:=ord(s[1])-ord('A')-1;
for i:=1 to c do
a[1]:=a[1]+lala(n+1-i)
for i:=1 to 26 do
m:=m+a[i];
writeln(m);
close(input);
close(output);
end.
