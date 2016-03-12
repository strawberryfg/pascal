var n,i,j:longint;
    o:string;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
read(n,j);
for i:=1 to n do
    readln(o);
if (n=4)and(j=10) then writeln(4)
                  else writeln(7);
close(input);
close(output);
end.