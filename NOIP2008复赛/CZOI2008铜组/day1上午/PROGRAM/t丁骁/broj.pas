var n,i,j,k,sum,s,s1:longint;
begin
assign(input,'broj.in');
assign(output,'broj.out');
reset(input);
rewrite(output);
readln(n);
sum:=0;
s:=1;
while s<>0 do
      begin
      s1:=1;
      for i:=1 to s do
          s1:=s1*10;
      if n<s1 then begin
                   sum:=sum+(n-s1 div 10+1)*s;
                   s:=0;
                   end
              else begin
                   sum:=sum+(s1-s1 div 10)*s;
                   inc(s);
                   end;
      end;
writeln(sum);
close(input);
close(output);
end.
