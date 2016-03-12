var n:array[1..10001]of integer;
    total,x,y:longint;
function asd(n:longint):longint;
   var i,j,k:longint;
       begin
       asd:=1;
       if i=2 then exit;
       for i:=2 to trunc(sqrt(n)) do
           if n mod i=0 then begin
                              asd:=0;
                              exit;
                              end;
       end;
begin
assign(input,'primenum.in');
assign(output,'primenum.out');
reset(input);
rewrite(output);
while not eoln do
      begin
      readln(n[total]);
      inc(total)
      end;
x:=total;
total:=0;
for y:=1 to x-1 do
    if asd(n[y])=1 then inc(total);
writeln(total);
close(input);
close(output);
end.