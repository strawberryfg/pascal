var f:array[0..310,0..310] of longint;
    a,b,sum1,sum2:array[0..310] of longint;
    n,i,j:longint;

  function try(x,y:longint):longint;
    var i,j,k:longint;
    begin
    if f[x,y]<>0 then exit(f[x,y]);
    for i:=1 to x-1 do
        for j:=1 to y-1 do
            begin
            k:=try(x-i,y-j)-(sum1[x-1]-sum1[x-i])*(sum1[x-1]-sum1[x-i])-(sum2[y-1]-sum2[y-j])*(sum2[y-1]-sum2[y-j]);
            if k>f[x,y] then f[x,y]:=k;
            end;
    f[x,y]:=f[x,y]+a[x]*b[y];
    if x=1 then f[x,y]:=f[x,y]-sum2[y-1]*sum2[y-1];
    if y=1 then f[x,y]:=f[x,y]-sum1[x-1]*sum1[x-1];
    try:=f[x,y];
    end;

begin
assign(input,'concert.in');
reset(input);
assign(output,'concert.out');
rewrite(output);
    readln(n);
    for i:=1 to n do
        readln(a[i]);
    for i:=1 to n do
        sum1[i]:=sum1[i-1]+a[i];
    for i:=1 to n do
        readln(b[i]);
    for i:=1 to n do
        sum2[i]:=sum2[i-1]+b[i];
    f[n+1,n+1]:=try(n+1,n+1);
    writeln(f[n+1,n+1]);
close(input);
close(output);
end.