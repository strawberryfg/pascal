var i,j,k,n,m,t:longint;
begin
assign(input,'best.in');
reset(input);
assign(output,'best.out');
rewrite(output);
read(n);
i:=1;
t:=1;
while n>1 do
      begin inc(i); n:=n-i; t:=t*i; end;
if n<0 then
   begin n:=n+i; t:=t div i; end;
j:=n;
while j>1 do
    begin
    t:=t div (j-1)*j;
    dec(j);
    end;
writeln(t);
close(input);
close(output);
end.
