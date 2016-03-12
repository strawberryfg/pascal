var i,n,m:longint;
    str:string;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
reset(output);  
readln(n,m);
for i:=1 to n do
  readln(str);
writeln(n);
close(input);
close(output);
end.
