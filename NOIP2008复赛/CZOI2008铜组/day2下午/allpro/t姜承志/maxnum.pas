label b;
var group:packed array[1..1000]of integer;
    min,i,i1,i2:integer;
begin
i:=1;
min:=32767;
assign(input,'maxnum.in');
assign(output,'maxnum.out');
reset(input);
while not eof do
      begin
      read(group[i]);
      if (group[i]<min)and(group[i]<>0) then min:=group[i];
      inc(i);
      end;
close(input);
dec(i);
dec(i);
for i1:=min downto 2 do
    begin
    for i2:=1 to i do
        if group[i2] mod i1<>0 then goto b;
    rewrite(output);
    writeln(i1);
    close(output);
    halt;
    b:
    end;
rewrite(output);
writeln(1);
close(output);
end.