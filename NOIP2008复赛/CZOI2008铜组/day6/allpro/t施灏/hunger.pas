var a,b,c:array[1..1000] of longint;
    n,i,j,x:longint;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(a[i]);
    read(b[i]);
    c[i]:=b[i]-a[i]+1;
    end;
for i:=1 to n-1 do
    begin
    for j:=i+1 to n do
        if(a[i]=a[j])
        or(b[i]=b[j])
        or(a[i]=b[j])
        or(a[j]=b[i])
        and(a[i]<>0)
        and(b[i]<>0)
        then
        if c[i]<c[j] then
                     begin
                     a[i]:=0;
                     b[i]:=0;
                     c[i]:=0;
                     end
                     else
                     begin
                     a[j]:=0;
                     b[j]:=0;
                     c[j]:=0;
                     end;
    end;
for i:=1 to n-1 do
    begin
    for j:=i+1 to n do
        if c[i]<c[j] then
                     begin
                     x:=c[i];
                     c[i]:=c[j];
                     c[j]:=x;
                     end;
    end;
x:=0;
for i:=1 to n do
    x:=x+c[i];
writeln(x);
close(input);
close(output);
end.