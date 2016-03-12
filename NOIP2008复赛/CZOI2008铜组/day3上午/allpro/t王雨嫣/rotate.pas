var n,i,j,t,total:longint;
    a:array[1..20,1..20]of longint;
begin
assign(input,'rotate.in');
reset(input);
assign(output,'rotate.out');
rewrite(output);
readln(n);
t:=1;
i:=1;
j:=1;
total:=0;
for t:=1 to (n+1)div 2 do
      begin
      for i:=t to n+1-t do
          begin
          inc(total);
          a[t,i]:=total;
          end;
      for i:=t+1 to n+1-t do
          begin
          inc(total);
          a[i,n+1-t]:=total;
          end;
      for i:=n-t downto t do
          begin
          inc(total);
          a[n+1-t,i]:=total;
          end;
      for i:=n-t downto t+1 do
          begin
          inc(total);
          a[i,t]:=total;
          end;
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
