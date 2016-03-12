var n,i,j,x,k,kk:longint;
    a,b,sa,sb:array[-1..10000] of longint;
    f:array[-1..1000,-1..1000] of longint;
function max(a,b:longint):longint;
begin
        if a>B then exit(a) else exit(b);
end;
begin
assign(input,'concert.in');reset(input);
assign(output,'concert.out');rewrite(output);
read(n);
read(a[1]);
sa[1]:=a[1];
for i:=2 to n do
        begin
        read(a[i]);
        sa[i]:=sa[i-1]+a[i];
        end;
read(b[1]);
sb[1]:=b[1];
for i:=2 to n do
        begin
        read(b[i]);
        sb[i]:=sb[i-1]+b[i];
        end;
for i:=1 to n+1 do
        for j:=1 to n+1 do
                begin
                        f[i,j]:=a[i]*b[j]-sqr(sb[j-1])-sqr(sa[i-1]);
                        for k:=1 to j-1 do
                                if i>1 then f[i,j]:=max(f[i,j],f[i-1,k]+a[i]*b[j]-sqr(sb[j-1]-sb[k]));
                        for k:=1 to i-1 do
                                if j>1 then f[i,j]:=max(f[i,j],f[k,j-1]+a[i]*b[j]-sqr(sa[i-1]-sa[k]));
                end;
writeln(f[n+1,n+1]);
close(input);
close(output);
end.