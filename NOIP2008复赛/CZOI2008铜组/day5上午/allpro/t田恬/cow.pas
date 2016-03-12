var s,n:integer;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
  readln(n);
  if n<8 then s:=n div 4 +(n-4)+1
         else s:=n div 4+(n-1)+1+n div 4-1+n-4 ;
         writeln(s);
close(input);
close(output);
end.