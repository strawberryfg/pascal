var g:packed array[1..10000]of int64;
    n,i,k,t:integer;
begin
assign(input,'tree.in');
assign(output,'tree.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    read(t);
    g[i]:=t+g[i];
    while not eoln do
          begin
          read(k);
          if g[i]>g[k] then g[k]:=g[i];
          end;
    end;
k:=0;
for i:=n downto 1 do if g[i]>k then k:=g[i];
writeln(k);
close(input);
close(output);
end.
