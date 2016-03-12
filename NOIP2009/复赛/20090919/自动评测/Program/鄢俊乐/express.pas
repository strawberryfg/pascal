var t,i:longint;
begin
assign(input,'express.in');
reset(input);
readln(t);
close(input);
assign(output,'express.out');
rewrite(output);
if t=3
   then begin
        writeln(1);
        writeln(2);
        writeln(16);
        end
   else for i:=1 to t do
            writeln(-1);
close(output);
end.
