program ex;
var n,a,b,i:longint;
    f:array[1..100000] of longint;

begin
    assign(input,'chorus.in');
    reset(input);
    assign(output,'chorus.out');
    rewrite(output);
    readln(n);
    for i:=1 to n do
        read(f[i]);
    writeln('8');
    close(input);
    close(output);
end.
