var t:char;
    a,b,n,d,i,s,sum:longint;
    ch:array[1..2500] of char;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
for i:=1 to n do
    read(ch[i]);
for i:=1 to n do
    begin
    if ch[i]='H' then inc(a)
                 else inc(b);
    if abs(a-b)>d then begin inc(sum);a:=0;b:=0;end;
    end;
writeln(sum);
close(input);
close(output);
end.