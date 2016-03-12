var n,m:longint;
    ans:int64;
function calc(x,y:longint):int64;
var i:longint;
    res:int64;
begin
res:=1;
for i:=1 to y do
    begin
    res:=int64(res)*int64(x+1-i);
    res:=int64(res) div int64(i);
    end;
exit(res);
end;
begin
assign(input,'flag.in');
reset(input);
assign(output,'flag.out');
rewrite(output);
readln(n,m);
if (n=1) then
   begin
   if m=1 then writeln(2);
   end
else
   begin
   if m mod 2=0 then
      begin
      ans:=int64(calc(n-1,m div 2))*int64(calc(n-1,m div 2-1));   //ends with red flag
      ans:=int64(ans)*int64(2);
      writeln(ans);
      end
   else
      begin
      ans:=int64(calc(n-1,m div 2))*int64(calc(n-1,(m+1)div 2-1));   //ends with yellow flag
      ans:=int64(ans)*int64(2);
      writeln(ans);
      end;
   end;
close(input);
close(output);
end.