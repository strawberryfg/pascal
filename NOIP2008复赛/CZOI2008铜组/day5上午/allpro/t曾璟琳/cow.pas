var n,i,s,k:longint;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
k:=0;
s:=1;
for i:=1 to n do
 begin
  if i mod 4=0 then begin k:=i;k:=k div 4;end;
  s:=s+k;
 end;
writeln(s);
close(input);
close(output);
end.