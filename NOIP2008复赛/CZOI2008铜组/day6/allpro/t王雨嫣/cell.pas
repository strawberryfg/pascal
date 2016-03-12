var m,n,i:longint;
    a:string;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(m,n);
for i:=1 to m do
    readln(a);
writeln(m);
close(input);
close(output);
end.
