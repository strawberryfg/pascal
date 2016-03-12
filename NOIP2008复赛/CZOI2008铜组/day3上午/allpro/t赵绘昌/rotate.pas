var a:array[1..20,1..20] of longint;
    i,j,k,l,n,total,start,lend,sh,xi:longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
start:=1;
lend:=n;
sh:=1;
xi:=n;
for i:=1 to n-2 do
    begin
    for j:=start to lend-1 do
        begin
        inc(total);
        a[sh,j]:=total;
        end;
    for j:=sh to xi-1 do
        begin
        inc(total);
        a[j,lend]:=total;
        end;
    for j:=lend downto start+1 do
        begin
        inc(total);
        a[xi,j]:=total;
        end;
    for j:=xi downto sh+1 do
        begin
        inc(total);
        a[j,start]:=total;
        end;
    inc(sh);
    dec(xi);
    inc(start);
    dec(lend);
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
    writeln;
    end;
close(input);
close(output);
end.
