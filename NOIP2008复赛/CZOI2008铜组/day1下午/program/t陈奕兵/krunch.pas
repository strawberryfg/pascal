var i,j,k:string;
    n:array[1..70]of string;
    x,y,c,d,d1:longint;
begin
assign(input,'krunch.in');
assign(output,'krunch.out');
reset(input);
rewrite(output);
readln(i);
j:='';
y:=length(i);
for x:=1 to y do
    n[x]:=i[x];
for x:=1 to y  do
    if (n[x]='A')or(n[x]='E')or(n[x]='I')or(n[x]='O')or(n[x]='U')
       then n[x]:='';

for x:=1 to y do
    for c:=1 to y do
    if (n[x]=n[c])and(x<>c) then n[C]:='';

for x:=2 to y do
    if (n[x-1]=n[x])and(n[x-1]=' ')and(n[x]=' ') then n[x]:='';

for x:=1 to y do
    if n[x]=' ' then n[x]:=''
             else x:=y;
for x:=y downto 1 do
    if n[x]=' ' then n[x]:=''
             else x:=1;
for x:=1 to y-1 do
    if (n[x]=' ')and((n[x-1]='?')or(n[x-1]='.')or(n[x-1]=','))
    then n[x]:='';
for x:=1 to y do
    write(n[x]);
close(input);
close(output);
end.