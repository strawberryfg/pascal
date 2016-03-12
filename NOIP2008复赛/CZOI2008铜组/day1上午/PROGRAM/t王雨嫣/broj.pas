var n,i,s,sum,s1,j,s2:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
s:=0;
i:=0;
sum:=0;
while s<=n do
      begin
      s1:=9;
      if i>=1 then
         for j:=1 to i-1 do
             s1:=s1*10;
      sum:=sum+i*s1;
      inc(i);
      s:=s*10+9;
      end;
s1:=1;
i:=i-1;
for j:=1 to i do
    s1:=s1*10;
sum:=sum+(n-s1+1)*(i+1);
writeln(sum);
close(input);
close(output);
end.