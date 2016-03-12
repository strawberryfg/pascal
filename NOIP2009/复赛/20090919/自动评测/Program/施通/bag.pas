var
    i,j,n:longint;
    a:array[1..100000] of longint;
begin
    assign(input,'bag.in');
    reset(input);
    assign(output,'bag.out');
    rewrite(output);
    read(n);
    n:=(n-1) mod 82834+1;
    a[1]:=1;
    a[2]:=5;
    for i:=3 to n do
        a[i]:=(a[i-1]+a[i-2]*4) mod 997;
    writeln(a[n]);
    close(input);
    close(output);
end.
