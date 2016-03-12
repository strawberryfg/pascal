var m,n,i,j:integer;
    a:string;
begin
read(m,n);
assign(input,'cell.in');reset(input);
assign(output,'cell.out');rewrite(output);
for i:=1 to n do readln(a);
writeln(m);
close(input);
close(output);
end.