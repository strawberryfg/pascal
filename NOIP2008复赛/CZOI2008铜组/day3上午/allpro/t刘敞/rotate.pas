var f:array[1..20,1..20]of longint;
    i,j,n,m,nn,k,d,a,b,q:longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(q);
i:=1;j:=1;
d:=-1;
n:=q;
nn:=n*n;
m:=n;
a:=1;b:=1;
for k:=1 to nn do
        begin
        f[i,j]:=k;
        if d=-1 then
                if (i=a)or(f[i-1,j]<>0) then inc(j)
                        else dec(j)
                else
                if (j=b)or(f[i,i-1]<>0) then dec(i)
                        else inc(i);
        if i>n then begin dec(i);dec(j);d:=-d;dec(m);end else
        if i<a then begin inc(i);inc(j);d:=-d;inc(b);end else
        if j>m then begin dec(j);inc(i);d:=-d;inc(a);end else
        if j<b then begin inc(j);dec(i);d:=-d;dec(n);end;
        end;
for i:=1 to q do
        begin
        for j:=1 to q do
                write(f[i,j]:4);
        writeln;
        end;
close(input);
close(output);
end.
