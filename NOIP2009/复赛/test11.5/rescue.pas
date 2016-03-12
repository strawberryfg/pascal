var f:array[1..30000]of longint;
    l,n,i:longint;

begin
assign(input,'rescue.in');
reset(input);
assign(output,'rescue.out');
rewrite(output);
readln(n);
l:=1;
for i:=1 to 30000 do
    if l<=i then begin f[i]:=l; inc(l,2); end
            else begin f[i]:=1; l:=3;     end;
for i:=1 to n do
    begin
    readln(l);
    writeln(f[l]);
    end;
close(input);
close(output);
end.
