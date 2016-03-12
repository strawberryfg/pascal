var x:array[1..100000000] of integer;
    n,i,j,s:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
read(n);
j:=0;
for i:=1 to n do
    x[i]:=i;
for i:=1 to n do
    if x[i]=1 then j:=j+1
              else if x[i]>1 then
                             begin
                             s:=x[i];
                             while s<>0 do
                             begin
                             s:=s div 10;
                             j:=j+1
                             end;
                             end;
writeln(j);
close(input);
close(output);
end.
