program count;
var n,b,i:longint;
    a:array [0..9]of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
        readln(n);
        for i:=1 to n do
        begin
                b:=i;
                while b<>0 do
                begin
                        inc(a[b mod 10]);
                        b:=b div 10;
                end;
        end;
        for i:=0 to 9 do
                writeln(a[i]);
close(input);
close(output);
end.