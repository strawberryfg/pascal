{4 5 2 3 4 6
 3 2 4 3 2 1}
begin
assign(input,'lis.in');
reset(input);
{assign(output,'lis.out');
rewrite(output);}
readln(n);
for i:=1 to n do
    read(a[i]);
readln(times);
for i:=1 to times do readln(b[i]);
for i:=1 to n do
    begin
    f[i]:=1;
    x[i]:=i;
    end;
for i:=n-1 downto 1 do
    begin
    for j:=i+1 to n do
        begin
        if a[j]>a[i] then
           begin
           f[i]:=f[j]+1;
           x[i]:=j;
           end;
        end;
    end;
for i:=1 to times do
    begin
    if cunzai[i]=0 then
    begin
    for j:=1 to n do
        if b[i]=f[j] then
           begin
           t:=f[j];
           s[i]:='';
           k:=j;
           while t<>1 do
                 begin
                 s[i]:=s[i]+char(x[j]+48);
                 k:=x[k];
                 t:=f[]

                 end;
           end;
    end;
close(input);
close(output);
end.
