const a:array[1..3] of longint=(1,2,5);
var f:array[-5..10000] of longint;
    n,ans:int64;

begin
assign(input,'sugar.in');
reset(input);
assign(output,'sugar.out');
rewrite(output);
    readln(n);
    {f[0]:=1;
    for i:=1 to 3 do
        for j:=1 to n do
            f[j]:=f[j]+f[j-a[i]];
    ans:=f[n]+f[n-1]*2+f[n-2]*2+f[n-3]*2+f[n-4]*2+f[n-5];
    writeln(ans);  }
    ans:=(n+1)*(n+2) div 2;
    writeln(ans);
close(input);
close(output);
end.
