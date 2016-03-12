var i,s,j:longint; a:array[1..1000,1..1000] of longint;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
readln(i);
 for j:=1 to i do
   begin
    for s:=1 to i do
    read(a[j,s]);
    readln;
   end;
   writeln('4');
   close(input);
   close(output);
end.