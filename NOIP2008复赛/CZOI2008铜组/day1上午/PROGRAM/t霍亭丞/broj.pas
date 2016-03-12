var n,i,s:longint;o,ni:string;
begin
assign(input,'broj.in');
assign(output,'broj.out');
reset(input);rewrite(output);
readln(n);
for i:=1 to n do
begin
str(i,ni);
o:=o+ni;
end;
writeln(length(o));
close(input);close(output);
end.