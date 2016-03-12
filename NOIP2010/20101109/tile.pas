const x=100003;
var a:array[1..500000,1..6] of longint;
    n,m,i,j:longint;

begin
assign(input,'tile.in');
reset(input);
assign(output,'tile.out');
rewrite(output);
    readln(n,m);
    a[1,2]:=1; a[2,2]:=2;
    for i:=3 to m do
        a[i,2]:=(a[i-1,2]+a[i-2,2])mod x;
    for i:=2 to n do
        a[1,i]:=i-2;
    for i:=2 to m do
        for j:=3 to n do
            a[i,j]:=(a[i-1,j]+a[i,j-1])mod x;
    if n*m mod 2=1 then writeln(0) else writeln(a[m,n]);
close(input);
close(output);
end.