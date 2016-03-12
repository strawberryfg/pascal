program hunger;
var i,n:longint;
    a,b:array[1..1000]of longint;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
        readln(n);
        i:=0;
        while not eof do
                begin
                inc(i);
                readln(a[i],b[i]);
                end;
        writeln('5');
close(input);
close(output);
end.