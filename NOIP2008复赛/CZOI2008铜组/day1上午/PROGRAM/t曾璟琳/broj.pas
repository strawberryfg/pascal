var n,i,t,k:longint;
    s:array[1..100000000]of longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
for i:=1 to n do
 begin
  t:=i;
  while t<>0 do
   begin
    t:=t div 10;
    inc(s[i]);
   end;
 end;
for i:=1 to n do
  k:=k+s[i];
writeln(k);
close(input);
close(output);
end.
