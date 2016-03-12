var  n,i:longint;
        a:array[1..100,1..100]of longint;
        b:array[1..10000]of longint;
begin
assign(input,'tree.in');
reset(input);
assign(output,'tree.out');
rewrite(output);
readln(n);
for i:=1 to n do
        begin
        b[i]:=0;
        while not eoln do
              begin
              inc(b[i]);
              read(a[i,b[i]]);
              end;
        readln;
        end;
writeln(a[1,1]+a[n,1]);
close(input);
close(output);
end.