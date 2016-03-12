var i,j,k,n,t,ls,y,v:longint;
    p:real;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(ls);
k:=0;
t:=0;
while (t<=ls) do
      begin
      p:=exp(k*ln(10)); y:=trunc(9*p);
      t:=t+y*(k+1);
      v:=v+y;
      inc(k);
      end;
t:=t-y*k; v:=v-y;
v:=v+(ls-t) div k;
writeln(v);
close(input);
close(output);
end.
