var a:string;i,j,s:longint;
procedure cut(i:longint);
var j:longint;b:string;
begin
for j:=i+1 to length(a) do
a[j-1]:=a[j];
b:=a;
a:='';
for j:=1 to length(b)-1 do a:=a+b[j];
end;
procedure try1(dep:longint);
var i,s:longint;
begin
s:=length(a);
for i:=dep to s do
if (a[i]='A')or(a[i]='E')or(a[i]='I')or(a[i]='O')or(a[i]='U')then
begin
cut(i);
try1(i);
end;
end;
begin
{assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);}
readln(a);
try1(1);
s:=length(a);
for i:=1 to s do
   for j:=i+1 to s do
   if (a[j]=a[i])and(j<>s) then cut(j);
s:=length(a);
for i:=1 to s do
if a[i]=' 'then if (i=1)or(i=s)or(a[i+1]=',')or(a[i+1]='.')or(a[i+1]='?')
then cut(i);
writeln(a);
close(input);
close(output);
end.
