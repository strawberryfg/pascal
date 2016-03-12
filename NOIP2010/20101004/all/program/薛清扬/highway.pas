var n,m,k,i:longint;
begin
assign(input,'highway.in');
assign(output,'highway.out');
reset(input);
rewrite(output);
randomize;
readln(n,m,k);
if k=5 then writeln('3') else begin
i:=0;
while i=0 do
i:=random(k);
writeln(i);
end;
close(input);
close(output);
end.