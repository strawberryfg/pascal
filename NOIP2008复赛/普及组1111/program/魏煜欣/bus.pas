var ans,i,j,h,n,d:longint;
    a:array[1..5000]  of char;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
for i:=1 to n do
        read(a[i]);
i:=1;
ans:=1;
while i<=n do
        begin
        if a[i]='H' then inc(h)
                    else inc(j);
        if (abs(h-j)<=d) or (h=0) or (j=0) then inc(i)
                                           else begin
                                                inc(ans);
                                                h:=0;
                                                j:=0;
                                                end;
        end;
writeln(ans);
close(input);
close(output);
end.
