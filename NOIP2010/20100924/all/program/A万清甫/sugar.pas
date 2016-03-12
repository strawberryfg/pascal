var n,a,b,c,w,d,count,t:longint;
begin
assign(input,'sugar.in');
reset(input);
assign(output,'sugar.out');
rewrite(output);
readln(n);
writeln(0.5*n*n+1.5*n+1:0:0);
close(output);
end.