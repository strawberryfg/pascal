var i,tn,n,tot:longint;
        a:array[1..100000]of longint;
        c:string;
begin
assign(input,'big.in');
reset(input);
assign(output,'big.out');
rewrite(output);
readln(n);
a[1]:=3;a[2]:=7;
tot:=2;
while a[tot]<1000000000 do
        begin
        inc(tot);
        a[tot]:=a[tot-1]+a[tot-2];
        end;
tn:=n;
c:='1234567';
while tn>7 do
        begin
        for i:=1 to tot do
                if tn<=a[i] then
                begin
                dec(tn,a[i-1]);
                break;
                end;
        end;
//writeln(tn);
writeln(c[tn]);
close(input);
close(output);
end.