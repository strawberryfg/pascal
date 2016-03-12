var n,t,k,v,p:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
t:=9;
k:=1;
v:=0;
p:=0;
while p<=n do
      begin
      if p+t<=n then begin p:=p+t;v:=v+t*k; t:=t*10; inc(k); end
                else break;
      end;
v:=v+(n-p)*k;
writeln(v);
close(input);
close(output);
end.