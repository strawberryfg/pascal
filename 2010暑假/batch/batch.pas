
var n,s,i,j,k,min,res:longint;
    sf,st,t,f,c:array[0..5000]of longint;
    a:array[0..5000,0..5000]of longint;
begin
assign(input,'batch.in');
reset(input);
assign(output,'batch.out');
rewrite(output);
readln(n);
readln(s);
for i:=1 to n do
    begin
    readln(t[i],f[i]);
    st[i]:=st[i-1]+t[i];
    sf[i]:=sf[i-1]+f[i];
    c[i]:=maxlongint;
    end;
for i:=1 to n do
    begin
    a[i,1]:=(st[i]+s)*(sf[i]);
    for j:=2 to i do
        begin
        for k:=1 to i-1 do
            begin
            if j-1>k then continue;
            res:=a[k,j-1]+(j*s+st[i])*(sf[i]-sf[k]);
            if a[i,j]=0 then a[i,j]:=res
                else if res<a[i,j] then a[i,j]:=res;
            end;
        end;
    end;
min:=maxlongint;
for i:=1 to n do
    if a[n,i]<min then min:=a[n,i];
writeln(min);
close(input);
close(output);
end.
