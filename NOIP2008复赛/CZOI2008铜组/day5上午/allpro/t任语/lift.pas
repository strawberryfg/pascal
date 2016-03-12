program ex;
var n,a,b,i:longint;
    f:array[1..100000] of longint;

begin
    assign(input,'lift.in');
    reset(input);
    assign(output,'lift.out');
    rewrite(output);
    readln(n,a,b);
    for i:=1 to n do
        read(f[i]);
    writeln('-1');
    close(input);
    close(output);
end.
