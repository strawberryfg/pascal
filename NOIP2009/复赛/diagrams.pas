type arr=array[-1..100]of longint;
var i,j,k,n,down:longint;
    tot,c:arr;
    f:array[0..100,-1..100]of arr;
procedure print(a:arr);
var i:longint;
begin
write(a[a[-1]]);
for i:=a[-1]-1 downto 0 do
    begin
    if a[i]>999 then write(a[i])
       else if a[i]>99 then write('0',a[i])
           else if a[i]>99 then write('00',a[i])
                else write('000',a[i]);
    end;
end;
function gjd(a,b:arr):arr;
var max,i:longint;
begin
if (b[-1]=0)and(b[0]=0) then exit(a);
fillchar(c,sizeof(c),0);
if a[-1]>b[-1] then max:=a[-1] else max:=b[-1];
for i:=0 to max do
    begin
    inc(c[i],a[i]+b[i]);
    inc(c[i+1],c[i] div 10000);
    c[i]:=c[i]mod 10000;
    end;
if c[max+1]<>0 then inc(max);
c[-1]:=max;
gjd:=c;
end;
begin
assign(input,'diagrams.in');
reset(input);
assign(output,'diagrams.out');
rewrite(output);
readln(n);
f[0,0,-1]:=0; f[0,0,0]:=1; f[0,-1,-1]:=0; f[0,-1,0]:=1;;
for i:=1 to n do
    begin
    if i=n then down:=1 else down:=0;
    for j:=i downto down do
        begin
        for k:=j downto 0 do
            f[i,j]:=gjd(f[i,j],f[i-1,k]);
        if i=n then tot:=gjd(tot,f[n,j]);
        end;
    end;
print(tot);
close(input);
close(output);
end.
