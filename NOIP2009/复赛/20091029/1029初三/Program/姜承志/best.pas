var n,w,g:int64;
    i,j:longint;
begin
assign(input,'best.in');
assign(output,'best.out');
reset(input);
readln(n);
close(input);
rewrite(output);
i:=trunc(sqrt(n));
g:=1;
i:=1;
while n>1 do
      begin
      inc(i);
      n:=n-i;
      g:=g*i;
      end;
g:=g div i;
n:=n+i;
for j:=i to i-n+1 do
    g:=(g div j)*(j+1);
writeln(g);
close(output);
end.