var a:array[1..11,1..6] of longint;
    i,j,n:longint;
begin
randomize;
for i:=1 to 10 do
    for j:=1 to 5 do
        begin
        a[i,j]:=50+random(51);
        a[i,6]:=a[i,6]+a[i,j];
        a[11,j]:=a[11,j]+a[i,j];
        end;
for i:=1 to 5 do
    a[11,i]:=a[11,i] div 10;
for i:=1 to 10 do
    n:=n+a[i,6];
a[11,6]:=n div 10;
write(' xuhao','   chs','   mat','   eng','   pol','   his','   tot');
writeln;
for i:=1 to 11 do
    begin
    if i=11 then write('pjf':5,':')
            else write(i:5,':');
    for j:=1 to 6 do
        write(a[i,j]:6);
    writeln;
    end;
end.