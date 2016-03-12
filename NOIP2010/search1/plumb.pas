var d,p,i,fmax,up,j,t1,t2,t:longint;
    f,tf:array[0..10000000]of boolean;
    res,tres:array[0..1000000]of longint;
    long,c,sum:array[0..60000]of longint;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;
begin
assign(input,'plumb.in');
reset(input);
assign(output,'plumb.out');
rewrite(output);
f[0]:=true;
readln(d,p);
for i:=1 to p do
    begin
    readln(long[i],c[i]);
    if int64(sum[i-1])+int64(long[i])>2147483647 then
       sum[i]:=maxlongint
    else sum[i]:=sum[i-1]+long[i];
    end;
fmax:=0;
for i:=1 to p do
    begin
    up:=d;
    tf:=f; tres:=res;
    f[0]:=true;
    if sum[i]<up then up:=sum[i];
    for j:=long[i] to up do
        begin
        t1:=0; t2:=0;
        if tf[j] then t1:=res[j];
        if tf[j-long[i]] then
           begin
           t:=tres[j-long[i]];
           if t=0 then t:=maxlongint;
           t2:=min(t,c[i]);
           end;
        if (t1=0)and(t2=0) then f[j]:=false else f[j]:=true;
        res[j]:=max(t1,t2);
        end;
    end;
writeln(res[d]);
close(input);
close(output);
end.
