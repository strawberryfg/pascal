var n,i,total:longint;
function len(i:longint):longint;
   begin
   len:=0;
   if i>=10 then begin i:=i div 10;len:=1+len(i); end
            else len:=len+1;
   end;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
read(n);
total:=0;
for i:=1 to n do
    begin
    total:=total+len(i);
    end;
writeln(total);
close(input);
close(output);
end.
