var
    m:int64;
    i,j,n,k,c,x:longint;
    d,f:array[0..20000] of int64;
procedure qsort(l,r:longint);
var
    i,j,t,x:longint;
begin
    i:=l;
    j:=r;
    x:=d[random(j-i+1)+i];
    repeat
        while d[i]<x do
            inc(i);
        while d[j]>x do
            dec(j);
        if i<=j then
        begin
            t:=d[i];
            d[i]:=t;
            d[j]:=d[i];
            inc(i);
            dec(j);
        end;
    until
        i>j;
    if i<r then
        qsort(i,r);
    if j>l then
        qsort(l,j);
end;
begin
    assign(input,'divide.in');
    assign(output,'divide.out');
    reset(input);
    rewrite(output);
    randomize;
    read(n,k,c);
    for i:=1 to n do
    begin
        read(x);
        d[i]:=x;
    end;
    qsort(1,n);
    for i:=1 to k do
        f[i]:=sqr(d[i]-d[1])+c;
    for i:=k+1 to n do
    begin
        m:=sqr(d[i]-d[1]);
        for j:=i-k downto k+1 do
            if sqr(d[i]-d[j])+f[j-1]<m then
                m:=sqr(d[i]-d[j])+f[j-1];
        f[i]:=m+c;
    end;
    writeln(f[n]);
    close(input);
    close(output);
end.
