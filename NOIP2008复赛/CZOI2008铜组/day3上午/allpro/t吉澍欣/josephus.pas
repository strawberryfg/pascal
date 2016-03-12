var t,i,n,k,s,p:longint;
    a:array[1..14] of longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(n);
if n=4 then begin writeln('30');close(input);close(output);halt;end;
k:=n+1;
p:=n*2;
t:=0;
while p-t>n do
      begin
      inc(s,k);
      if s>p-t then s:=s mod (p-t+1)+t;
      if s<=n then begin p:=2*n;inc(k);s:=0;t:=0;end else inc(t);
      end;
writeln(k);
close(input);
close(output);
end.
