var a:array[1..2500]of longint;
    b:array[1..2500,1..2500]of integer;
    p:array[1..2500,1..2500]of boolean;
    f:array[0..2500]of longint;
    n,d,i,j,temp,s:longint;
    c:char;
    pd:boolean;
function min(a,b:longint):longint;
begin
if a<b then min:=a
       else min:=b;
end;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
readln(n,d);
for i:=1 to n do
    begin
    read(c);
    if c='H' then a[i]:=1;
    if c='J' then a[i]:=-1;
    end;
readln;
fillchar(p,sizeof(p),false);
for i:=1 to n do
    begin
    pd:=true;
    s:=0;
    temp:=a[i];
    for j:=i to n do
        begin
        if a[j]<>temp then pd:=false;
        p[i,j]:=pd;
        s:=s+a[j];
        b[i,j]:=s;
        end;
    end;
f[0]:=0;
for i:=1 to n do
    begin
    f[i]:=f[i-1]+1;
    for j:=1 to i-1 do
        begin
        if (abs(b[j,i])<=d) then
           f[i]:=min(f[i],f[j-1]+1);
        if p[j,i]=true then
           f[i]:=min(f[i],f[j-1]+1);
        end;
    end;
writeln(f[n]);
close(input);
close(output);
end.