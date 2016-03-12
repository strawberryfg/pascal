var r:array[0..2500] of longint;
    c:char;
    n,d,di,mi,s,i:longint;
begin
assign(input,'bus.in');
reset(input);
readln(n,d);
for i:=1 to n do
    begin
    read(c);
    if c='H'
       then r[i]:=r[i-1]+1
       else r[i]:=r[i-1]-1;
    if (abs(r[i])<=d) or (abs(r[i])=i)
       then mi:=i;
    end;
close(input);
while mi<=n do
      begin
      di:=mi;
      inc(mi);
      inc(s);
      for i:=mi to n do
          begin
          r[i]:=r[i]-r[di];
          if (abs(r[i])<=d) or (abs(r[i])=i-di)
             then mi:=i;
          end;
      end;
assign(output,'bus.out');
rewrite(output);
writeln(s);
close(output);
end.
